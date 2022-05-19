<?php
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

require_once("model.php");

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

// DSN : データソースネーム : H-ACCDB / 
$dbh = new PDO("sqlite:C:/app/workspace/lightbox.sqlite3");
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// キャラクタセット変換
$sql = "SELECT * FROM 社員マスタ";

$stmt = $dbh->prepare($sql);

$stmt->execute();

// fetch は引数なし
while( $rows = $stmt->fetch() ){
    print $rows["社員コード"] . " / ";
    print $rows["氏名"] . "<br>";
}

?>
