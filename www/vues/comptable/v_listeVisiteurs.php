<?php

namespace gsb;
?>
<div class="row">
    <form action="index.php?uc=validerFrais&action=validerSaisieFraisVisiteur"
          method="post" role="form" id="formChoixVisiteur">
        <div class="form-inline">
            <div class="row">
                <label for="lstVisiteurs" accesskey="n">Choisir le visiteur : </label>
                <div class="form-group">
                    <select id="lstVisiteurs" name="lstVisiteurs" class="form-control">
                        <?php
                        foreach ($lesFiches as $uneFiche) {
                            $id = $uneFiche['id'];
                            $nom = $uneFiche['nom'];
                            $prenom = $uneFiche['prenom'];

                            if ($id == $idVisiteur) {
                                ?>
                                <option value="<?php echo $id; ?>" selected="selected">
                                    <?php echo strtoupper($nom) . ' ' . $prenom; ?> </option>
                                <?php
                            }
                            else
                            {
                                ?>
                                <option value="<?php echo $id; ?>">
                                    <?php echo strtoupper($nom) . ' ' . $prenom; ?> </option>
                                <?php
                            }
                        }
                            ?>

                    </select>
                </div>

                <label for="lstMois" accesskey="n">Mois : </label>
                <div class="form-group">
                    <select id="lstMois" name="lstMois" class="form-control">
                        <?php
                        foreach ($lesMoisDisponibles as $unMois) {
                            $mois = $unMois['mois'];
                            $numAnnee = $unMois['numAnnee'];
                            $numMois = $unMois['numMois'];
                            if ($mois == $moisChoisi) {
                                ?>
                                <option selected="selected" value="<?php echo $mois ?>">
                                    <?php echo $numMois . '/' . $numAnnee ?> </option>
                                <?php
                            } else {
                                ?>
                                <option value="<?php echo $mois ?>">
                                    <?php echo $numMois . '/' . $numAnnee ?> </option>
                                <?php
                            }
                        }
                        ?>
                    </select>
                </div>

                <input id="ok" type="submit" value="OK" class="btn btn-success" role="button">
        </div>
    </form>
</div>