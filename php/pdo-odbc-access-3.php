<?php
// extension=pdo_odbc を有効に
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

require_once("model.php");

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

// DSN : データソースネーム : H-ACCDB / 
// $dbh = new PDO("odbc:H-ACCDB");
$hanbai = conv("販売管理","UTF-8");
$dbh = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:\\app\\workspace\\{$hanbai}.accdb");
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
