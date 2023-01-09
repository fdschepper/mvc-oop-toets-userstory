<?php require(APPROOT . '\views\includes\head.php') ?>
<h3><?= $data['title'] ?></h3>

<h5><?= $data['instructeurNaam'] ?></h5>

<table border='1'>
    <thead>
        <th>Datum</th>
        <th>Tijd</th>
        <th>Naam Leerling</th>
        <th>Lesinfo</th>
        <th>Onderwerp</th>
    </thead>
    <tbody>
        <?= $data['rows'] ?>
    </tbody>
</table>