<?php

if(empty($_SESSION['ficheChoisie'])) {
    $_SESSION['ficheChoisie'] = '';
}

$lesFiches                = $pdo->getListeFicheFraisValidees();
$ficheChoisie             = isset($_POST['lstFiches']) ? filter_input(INPUT_POST, 'lstFiches', FILTER_SANITIZE_STRING) : $_SESSION['ficheChoisie'];
$_SESSION['ficheChoisie'] = isset($ficheChoisie) ? $ficheChoisie : null;

if(strlen($ficheChoisie) > 0) {
    $ficheChoisie = explode('-', $ficheChoisie); 
    $idVisiteur = $ficheChoisie[0];
    $idMois =  $ficheChoisie[1];

    $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $idMois);
    $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $idMois);
    $infosFiche = $pdo->getLesInfosFicheFrais($idVisiteur, $idMois);
}
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);

switch ($action) {
    case 'miseEnPaiementFiche':
        if(!$ficheChoisie) {
            continue;
        }

        if(isset($_POST['paiement'])) {
            switch($infosFiche['idEtat']) {
                case 'RB':
                    $_SESSION['flash'] = 'La fiche de frais est déjà remboursée, elle ne peut donc pas être mise en paiement !';
                    break;

                case 'PA':
                    $_SESSION['flash'] = 'La fiche de frais est déjà payée, elle ne peut donc pas être mise en paiement !';
                    break;

                // affichage des fiches validées
                case 'VA':
                    $pdo->majEtatFicheFrais($idVisiteur, $idMois, 'PA'); //PA = fiche payée
                    $_SESSION['flash'] = 'La fiche de frais a bien été mise en paiement';
                    break;

                default:
                    $_SESSION['flash'] = 'Erreur : La mise en paiement de la fiche est impossible. Vérifier que le workflow de celle-ci a été respecté.';
                    break;
            }
        } elseif(isset($_POST['remboursement'])) {
            switch($infosFiche['idEtat']) {
                case 'VA':
                    $_SESSION['flash'] = 'La fiche de frais doit être mise en paiement avant d\'être remboursée !';
                    break;

                case 'RB': //RB pour remboursé
                    $_SESSION['flash'] = 'La fiche de frais est déjà remboursée !';
                    break;

                
                case 'PA':
                    $pdo->majEtatFicheFrais($idVisiteur, $idMois, 'RB');
                    $_SESSION['flash'] = 'La fiche de frais a bien été classée comme remboursée.';
                    break;

                default:
                    $_SESSION['flash'] = 'Erreur : La remboursement de la fiche est impossible. Vérifier que le workflow de celle-ci a été respecté.';
                    break;
            }
        }
        header('Location: index.php?uc=suivreFrais');
        break;

    case'selectionnerMois':
        
        if($_SESSION['ficheChoisie']) {
            unset($_SESSION['ficheChoisie']);
            header('Location: index.php?uc=suivreFrais&action=selectionnerMois');
        }
        break;

    case 'export':
        $storagePath = __DIR__. '/../pdf/';
        $filePath    = $storagePath . $idVisiteur. '_'. $idMois. '.pdf';

        
        if(!file_exists($filePath)) {
          
            ob_end_clean();

            ob_start();
            include( __DIR__. '/../pdf.php');
            $pdfContent = ob_get_clean();

            
            $mpdf = new Mpdf\Mpdf();
            $mpdf->writeHTML($pdfContent);
            $file = $mpdf->Output($filePath, \Mpdf\Output\Destination::FILE);
        }

        header('Content-type: application/force-download');
        header('Content-Disposition: attachment; filename='.basename($filePath));
        readfile($filePath);
        exit;
        break;
}
if($lesFiches) {
    require 'vues/comptable/v_suivreFrais.php';
} else {
    require 'vues/comptable/v_suiviFraisVide.php';
}