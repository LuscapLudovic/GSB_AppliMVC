<?php

$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
if (!$uc) {
    $uc = 'demandeconnexion';
}

switch ($action) {
    case 'demandeConnexion':
        include 'vues/v_connexion.php';
        break;
    case 'valideConnexion':
        $login = filter_input(INPUT_POST, 'login', FILTER_SANITIZE_STRING);
        $mdp = filter_input(INPUT_POST, 'mdp', FILTER_SANITIZE_STRING);

        $membre = $pdo->getInfosMembre($login, $mdp);

        if (!is_array($membre)) {
            ajouterErreur('Login ou mot de passe incorrect');
            include 'vues/v_erreurs.php';
            include 'vues/v_connexion.php';
        } else {
            $id = $membre['id'];
            $nom = $membre['nom'];
            $prenom = $membre['prenom'];
            $rang = $membre['rang'];
            connecter($id, $nom, $prenom, $rang);
            header('Location: index.php');
        }
        break;
    default:
        include 'vues/v_connexion.php';
        break;
}
