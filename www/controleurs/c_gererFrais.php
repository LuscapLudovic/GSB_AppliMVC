<?php

$idMembre = $_SESSION['idMembre'];
$mois = getMois(date('d/m/Y'));
$numAnnee = substr($mois, 0, 4);
$numMois = substr($mois, 4, 2);
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
$infosFicheFrais = $pdo->getlesInfosFicheFrais($idMembre, $mois);

switch ($action) {
    case 'saisirFrais':
        if ($pdo->estPremierFraisMois($idMembre, $mois)) {
            $pdo->creeNouvellesLignesFrais($idMembre, $mois);
        }
        break;
    case 'validerMajFraisForfait':
        $lesFrais = filter_input(INPUT_POST, 'lesFrais', FILTER_DEFAULT, FILTER_FORCE_ARRAY);
        if (lesQteFraisValides($lesFrais)) {
            $pdo->majFraisForfait($idMembre, $mois, $lesFrais);
            header('Location: index.php?uc=gererFrais&action=saisirFrais');
        } else {
            ajouterErreur('Les valeurs des frais doivent être numériques');
            include 'vues/v_erreurs.php';
        }
        break;
    case 'validerCreationFrais':
        $dateFrais = filter_input(INPUT_POST, 'dateFrais', FILTER_SANITIZE_STRING);
        $libelle = filter_input(INPUT_POST, 'libelle', FILTER_SANITIZE_STRING);
        $montant = filter_input(INPUT_POST, 'montant', FILTER_VALIDATE_FLOAT);
        valideInfosFrais($dateFrais, $libelle, $montant);
        if (nbErreurs() != 0) {
            include 'vues/v_erreurs.php';
        } else {
            $pdo->creeNouveauFraisHorsForfait(
                $idMembre,
                $mois,
                $libelle,
                $dateFrais,
                $montant
            );
        }
        break;
    case 'supprimerFrais':
        $idFrais = filter_input(INPUT_GET, 'idFrais', FILTER_SANITIZE_STRING);
        $pdo->supprimerFraisHorsForfait($idFrais);
        break;
}
$lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idMembre, $mois);
$lesFraisForfait = $pdo->getLesFraisForfait($idMembre, $mois);
require 'vues/v_listeFraisForfait.php';
require 'vues/v_listeFraisHorsForfait.php';
