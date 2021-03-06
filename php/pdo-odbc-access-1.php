<?php
// extension=pdo_odbc を有効に
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

// DSN : データソースネーム : H-ACCDB / 
// $dbh = new PDO("odbc:H-ACCDB");
$hanbai = mb_convert_encoding("販売管理", "cp932", "UTF-8");
$dbh = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:\\app\\workspace\\{$hanbai}.accdb");
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// キャラクタセット変換
$sql = mb_convert_encoding("SELECT * FROM 社員マスタ", "cp932", "UTF-8");

$stmt = $dbh->prepare($sql);
$stmt->execute();

// fetch は引数なし
while( $rows = $stmt->fetch() ){
    print mb_convert_encoding($rows[0], "UTF-8", "cp932") . " / ";
    print mb_convert_encoding($rows[mb_convert_encoding("社員コード","cp932", "UTF-8")], "UTF-8", "cp932") . " / ";
    print mb_convert_encoding($rows[1], "UTF-8", "SJIS") . " / ";
    print mb_convert_encoding($rows[mb_convert_encoding("氏名","cp932", "UTF-8")], "UTF-8", "cp932") . "<br>";
}

?>
