<?php require(APPROOT . '\views\includes\head.php') ?>
<h3><?= $data['title'] ?></h3>

<p>Auto van instructeur:
<h5><?= $data['instructeurNaam'] ?></h5>
</p>
<p>E-mailadres:
<h5><?= $data['EmailAdres'] ?></h5>
</p>
<p>Kenteken auto:
<h5><?= $data['Kenteken'] ?></h5>
</p>



<table border='1'>
    <thead>
        <th>Datum</th>
        <th>mankement</th>
    </thead>
    <tbody>
        <?= $data['rows'] ?>
    </tbody>
</table>