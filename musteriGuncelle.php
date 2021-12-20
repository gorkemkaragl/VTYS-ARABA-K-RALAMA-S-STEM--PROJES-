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
  <h1 class="display-2 text-center">Müşteri Güncelleme Sayfası</h1><br><hr><br>


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

  <br><br><br><br>
  <form action="" method="post">
    Müşteri No:<br />
    <input type="number" name="musteriNo" required="required" /><br />
    Adınız:<br />
    <input type="text" name="ad" required="required" /><br />
    Soyadınız:<br />
    <input type="text" name="soyad" required="required" /><br>
    cinsiyet No:<br />
    <input type="number" name="cinsiyetNo" required="required" /><br />
    il No:<br />
    <input type="number" name="ilNo" required="required" /><br /><br>
    <input type="submit" value="Güncelle" />
   <br>
</form>
  

<?php

require_once 'baglanti.php';
require_once 'database.class.php';

if (isset($_POST['musteriNo'], $_POST['ad'], $_POST['soyad'], $_POST['cinsiyetNo'], $_POST['ilNo'])) {

  $musteriNo = trim(filter_input(INPUT_POST, 'musteriNo', FILTER_SANITIZE_STRING));
  $ad = trim(filter_input(INPUT_POST, 'ad', FILTER_SANITIZE_STRING));
  $soyad = trim(filter_input(INPUT_POST, 'soyad', FILTER_SANITIZE_STRING));
  $cinsiyetNo = trim(filter_input(INPUT_POST, 'cinsiyetNo', FILTER_SANITIZE_STRING));
  $ilNo = trim(filter_input(INPUT_POST, 'ilNo', FILTER_SANITIZE_STRING));
  

  if (empty($musteriNo) || empty($ad) || empty($soyad) || empty($cinsiyetNo) || empty($ilNo)) {
      die("<p>Lütfen formu eksiksiz doldurun!</p>");
  }

    try {

      $dsn = "pgsql:host=$host;port=5432;dbname=$db;";
          
      $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    
      $sorgu = $pdo->prepare('UPDATE "Musteri" SET "ad"=?,"soyad"=?,"cinsiyetNo"=?,"ilNo"=?  WHERE "musteriNo"=? ');
            $sorgu->bindParam(5, $musteriNo, PDO::PARAM_STR);
            $sorgu->bindParam(1, $ad, PDO::PARAM_STR);
            $sorgu->bindParam(2, $soyad, PDO::PARAM_STR);
            $sorgu->bindParam(3, $cinsiyetNo, PDO::PARAM_STR);
            $sorgu->bindParam(4, $ilNo, PDO::PARAM_STR);
            $sorgu->execute();

            echo "<br><p>Müşteri Başarılı bir şekilde güncellendi ve tablo sonuna eklendi</p>";

      

    } catch (PDOException $e) {
      die($e->getMessage());
    } finally {
      if ($pdo) {
        $pdo = null;
      }
    }
      


}
  
 
?>



</div>
</div>




    

</body>
</html>