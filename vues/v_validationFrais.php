<?php
/**
 * Created by PhpStorm.
 * User: Ludovic
 * Date: 12/12/2018
 * Time: 14:57
 */
?>
<div class="Choixvisiteur">
	<p>Choisir le visiteur:
		<form>
			<SELECT name="visiteur" id="visiteur">
				<?php
				getNomVisiteur();
				for ($i = 0; $i < count($lesLignes); $i++) {
				echo '<option value="nom"'.$nom[$leslignes].' '.$prenom[$leslignes].'</option>';
				}
				?>
			</SELECT>
		</form>
	</p>
</div>
 <div class="row">    
    <h2>Valider ma fiche de Frais</h2>
    <h3>Eléments forfaitisés</h3>
    <div class="col-md-4">
        <form method="post" 
              action="index.php?uc=gererFrais&action=validerMajFraisForfait" 
              role="form">
            <fieldset>       
                                    <div class="form-group">
                        <label for="idFrais">Forfait Etape</label>
                        <input type="text" id="idFrais" 
                               name="lesFrais[ETP]"
                               size="10" maxlength="5" 
                               value="0" 
                               class="form-control">
                    </div>
                                        <div class="form-group">
                        <label for="idFrais">Frais Kilométrique</label>
                        <input type="text" id="idFrais" 
                               name="lesFrais[KM]"
                               size="10" maxlength="5" 
                               value="0" 
                               class="form-control">
                    </div>
                                        <div class="form-group">
                        <label for="idFrais">Nuitée Hôtel</label>
                        <input type="text" id="idFrais" 
                               name="lesFrais[NUI]"
                               size="10" maxlength="5" 
                               value="0" 
                               class="form-control">
                    </div>
                                        <div class="form-group">
                        <label for="idFrais">Repas Restaurant</label>
                        <input type="text" id="idFrais" 
                               name="lesFrais[REP]"
                               size="10" maxlength="5" 
                               value="0" 
                               class="form-control">
                    </div>
                                    <button class="btn btn-success" type="submit">Corriger</button>
                <button class="btn btn-danger" type="reset">Réinitialiser</button>
            </fieldset>
        </form>
    </div>
</div>
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
                <td>
                    <button class="btn btn-success" type="submit">Corriger</button>
                    <button class="btn btn-danger" type="reset">Réinitialiser</button>
                </td>
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