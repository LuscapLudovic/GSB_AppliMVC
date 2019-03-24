<?php
/**
 * Created by PhpStorm.
 * User: Ludovic
 * Date: 07/01/2019
 * Time: 15:55
 */
?>

<div class="row">
    <div class="col-md-2">
        Choisissez le nom :
    </div>
    <div class="col-md-4" onload="choixVisiteur.submit();">
        <form action="index.php?uc=valideFrais&action=validationFrais"
        method="post" role="form" name="choixVisiteur">
            <div class="form-group">
                <select id="listNom" name="listNom" class="form-control">
                    <?php
                    foreach($lesVisiteurs as $unVisiteur){
                        $nom = $unVisiteur['nom'];
                        $prenom = $unVisiteur['prenom'];
                    ?>
                        <option selected value="<?php echo $nom,$prenom ?>">
                            <?php echo $nom.' '.$prenom?>
                        </option>
                    <?php
                    }
                    ?>
                </select>
            </div>
        </form>
    </div>
</div>
