<?php
/**
 * Created by PhpStorm.
 * User: Ludovic
 * Date: 05/01/2019
 * Time: 16:01
 */

$idVisiteur = $_SESSION['idVisiteur'];
$mois = getMois(date('d/m/Y'));
$numAnnee = substr($mois, 0, 4);
$numMois = substr($mois, 4, 2);
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
$groupe = $_SESSION['groupe'];
//Il faudra mettre les actions du fichier v_validationFrais.php pour que l'on appelle dedans uniquement des actions dans l'html
switch ($action){
case 'choixVisiteur':
    break;
case 'validationFrais':
    break;
case 'validationHorsForfait':
    $lesFraisHorsForfait = $pdo->getFraisHorsForfaitVisiteur($idVis, $leMois);
    break;
case 'initFrais':
    break;
case 'initHorsForfait':
    break;
}
