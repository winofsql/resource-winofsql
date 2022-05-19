<?php
// extension=pdo_odbc を有効に
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

require_once("model.php");

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

$hanbai = conv("販売管理","UTF-8");

// DSN : データソースネーム : H-ACCDB / 
$dbh = new PDO("odbc:H-ACCDB");
// $dbh = new PDO("odbc:H-MDB");
// $dbh = new PDO("odbc:H-XLSX");
// $dbh = new PDO("odbc:H-XLS");
// $dbh = new PDO("odbc:H-CSV");    // 社員マスタ.csv に変更
// $dbh = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:\\app\\workspace\\{$hanbai}.accdb");
// $dbh = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:\\app\\workspace\\{$hanbai}.mdb");
// $dbh = new PDO("odbc:Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};Dbq=C:\\app\\workspace\\{$hanbai}.xlsx");
// $dbh = new PDO("odbc:Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};Dbq=C:\\app\\workspace\\{$hanbai}.xls");
// $dbh = new PDO("odbc:Driver={Microsoft Access Text Driver (*.txt, *.csv)};Dbq=C:\\app\\workspace\\csv");    // 社員マスタ.csv に変更
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// キャラクタセット変換
$sql = conv("SELECT * FROM 社員マスタ", "UTF-8");

$stmt = $dbh->prepare($sql);
$stmt->execute();

// fetch は引数なし
while( $rows = $stmt->fetch() ){
    print conv($rows[0], "cp932") . " / ";
    print field($rows,"社員コード") . " / ";
    print conv($rows[1], "cp932") . " / ";
    print field($rows,"氏名") . "<br>";
}

?>
