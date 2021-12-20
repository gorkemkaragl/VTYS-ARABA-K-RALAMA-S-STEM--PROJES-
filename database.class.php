<?php
namespace dbArabaKiralamaSistemi;
use \PDO;
class Database{

public function getRows($query,$params=null)
	{	// Tüm satırları almak için kullanılır
		try{
		return $this->myQuery($query, $params)->fetchAll();
		}catch(PDOException $e){
			die($e->getMessage()); 
		}
		
	}
}
    ?>