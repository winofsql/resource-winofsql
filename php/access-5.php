<?php
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

require_once("model.php");

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

// DSN : データソースネーム : H-ACCDB / 
$dbh = new PDO("odbc:S3-LIGHTBOX");
// $dbh = new PDO("odbc:Driver={SQLite3 ODBC Driver};Database=C:\\app\\workspace\\lightbox.sqlite3");
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// キャラクタセット変換
$sql = conv("SELECT * FROM 社員マスタ", "UTF-8");

$stmt = $dbh->prepare($sql);

$stmt->execute();

// fetch は引数なし
while( $rows = $stmt->fetch() ){
    print field_s3($rows,"社員コード") . " / ";
    print field_s3($rows,"氏名") . "<br>";
}

?>
