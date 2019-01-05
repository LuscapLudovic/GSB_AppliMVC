<?php
/**
 * Created by PhpStorm.
 * User: Ludovic
 * Date: 12/12/2018
 * Time: 14:57
 */

require 'vues/v_enteteGestion.php';
?>
<div class="panel panel-info">
    <div class="panel-heading">
        Descriptif des élémentes hors forfait
    </div>
    <table class="table table-bordered table-responsive">
        <tr>
            <th class="date">Date</th>
            <th class="libelle">Libellé</th>
            <th class="montant">Montant</th>
            <th></th>
        </tr>
        <?php
        foreach($lesFraisHorsForfait as $unFraisHorsForfait){
            $date = $unFraisHorsForfait['date'];
            $libelle = htmlspecialchars($unFraisHorsForfait['libelle']);
            $montant = $unFraisHorsForfait['montant'];?>
            <tr>
                <td><?php echo $date?></td>
                <td><?php echo $libelle?></td>
                <td><?php echo $montant?></td>
                <!-- Il manque les boutons "Corriger" et "Réinitialiser" à faire-->
            </tr>
        <?php
        }
        ?>
    </table>
    Nombre de justificatifs reçu : <?php echo $nbJustificatifs ?>
</div>
<?php
require 'vues/v_pied.php';
?>