<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body style='background-image:url(/img/car.jpg); background-size:100% ; color:white'>
<div class="container">
  <div class="col-md-12 center">

  <h1 class="text-center">Veritabanı Dersi Proje Ödevi</h1>
  <br><br>
  <h1 class="display-2 text-center">Müşteri Güncel Tablosu</h1><br><hr><br>
  <div class="row">
    <div class="col">
      <button type="button" onclick="window.location.href='/index.php';" class="btn btn-outline-light">Anasayfa</button>
    </div>
    <div class="col">
      <button type="button" onclick="window.location.href='/musteriGoster.php';" class="btn btn-outline-light">Müşterileri Göster</button>
    </div>
    <div class="col">
      <button type="button" onclick="window.location.href='/musteriEkle.php';" class="btn btn-outline-light">Müşteri Ekle</button>
    </div>
    <div class="col">
      <button type="button" onclick="window.location.href='/musteriSil.php';" class="btn btn-outline-light">Müşteri Sil</button>
    </div>
    <div class="col">
      <button type="button" onclick="window.location.href='/musteriGuncelle.php';" class="btn btn-outline-light">Müşteri Güncelle</button>
    </div>
    <div class="col">
      <button type="button" onclick="window.location.href='/musteriFiltrele.php';" class="btn btn-outline-light">Müşteri Filtrele</button>
    </div>
    <div class="col">
      <button type="button" onclick="window.location.href='/arabalariGoster.php';" class="btn btn-outline-light">Arabaları Göster</button>
    </div>
  </div><br>
  <hr>
  <br><br>
<?php

require_once 'baglanti.php';
require_once 'database.class.php';

try {
	$dsn = "pgsql:host=$host;port=5432;dbname=$db;";
	
	$pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);


print"<table class='table' style='color:white;'>";
print"<tr><td>Müşteri No </td><td> Ad  </td><td>Soyad </td><td>Cinsiyet No</td><td>İl No";
$result=$pdo->query('select*from "Musteri"');
foreach($result as $row){
  print"<tr><td>".$row['musteriNo']."</td>";
  print"<td>".$row['ad']."</td>";
  print"<td>".$row['soyad']."</td>";
  print"<td>".$row['cinsiyetNo']."</td>";
  print"<td>".$row['ilNo']."</td>";
}

} catch (PDOException $e) {
	die($e->getMessage());
} finally {
	if ($pdo) {
		$pdo = null;
	}
}




?>

</div>

</div>




    

</body>
</html>