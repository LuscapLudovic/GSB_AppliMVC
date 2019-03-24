<?php

namespace gsb;
?>
<div class="row">
    <h3>Eléments forfaitisés</h3>
    <div class="col-md-4">
        <form method="post"
              action="index.php?uc=validerFrais&action=validerMajFraisForfait""
              role="form">
            <fieldset>
                <?php
                foreach ($lesFraisForfait as $unFrais) {
                    $idFrais = $unFrais['idfrais'];
                    $libelle = htmlspecialchars($unFrais['libelle']);
                    $quantite = $unFrais['quantite']; ?>
                    <div class="form-group">
                        <label for="idFrais"><?php echo $libelle ?></label>
                        <input type="text" id="idFrais"
                               name="lesFrais[<?php echo $idFrais ?>]"
                               size="10" maxlength="5"
                               value="<?php echo $quantite ?>"
                               class="form-control">
                    </div>
                    <?php
                }
                ?>

                <div class="form-group">
                    <label for="lesFrais[VEH]">Type de véhicule</label>
                    <select class="form-control" id="lesFrais[VEH]" name="lesFrais[VEH]">
                        <?php
                        foreach($lesVehicules as $leVehicule) {
                            if($leVehicule['id'] == $infosFicheFrais['idvehicule']) {
                                ?>
                                <option value="<?php echo $leVehicule['id']; ?>" selected="selected"><?php echo $leVehicule['nom']; ?></option>
                                <?php
                            } else {
                                ?>
                                <option value="<?php echo $leVehicule['id']; ?>"><?php echo $leVehicule['nom']; ?></option>
                                <?php
                            }
                        }
                        ?>
                    </select>
                </div>

                <button class="btn btn-success" type="submit">Ajouter</button>
                <button class="btn btn-danger" type="reset">Effacer</button>
            </fieldset>
        </form>
    </div>
</div>
