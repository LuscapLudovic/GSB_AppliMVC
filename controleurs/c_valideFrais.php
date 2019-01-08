<?php
/**
 * Created by PhpStorm.
 * User: Ludovic
 * Date: 05/01/2019
 * Time: 16:01
 */

$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
$idVisiteur = $_SESSION['idVisiteur'];
//Il faudra mettre les actions du fichier v_validationFrais.php pour que l'on appelle dedans uniquement des actions dans l'html
switch ($action){
case 'choixVisiteur':
    $lesVisiteurs = $pdo->getNomVisiteur();
    var_dump($lesVisiteurs);
    include 'vues/v_listeVisiteur.php';
    break;
case 'validationFrais':
    /*$lesFraisHorsForfait = $pdo->getFraisHorsForfaitVisiteur($idVis, $leMois);
    $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
    $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];*/
    include 'vues/v_validationFrais.php';
    break;
}
?>