<?php
// extension=odbc を有効に
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

require_once("model.php");

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

$hanbai = mb_convert_encoding("販売管理", "cp932", "UTF-8");

// DSN : データソースネーム : H-ACCDB / 
$dbh = odbc_connect("H-ACCDB","","");
// $dbh = odbc_connect("Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:/app/workspace/{$hanbai}.accdb","","");

// キャラクタセット変換
$sql = conv("SELECT * FROM 社員マスタ", "UTF-8");

$result = odbc_exec( $dbh, $sql );

// fetch は引数なし
while( $rows = odbc_fetch_array( $result ) ){
    print field($rows,"社員コード") . " / ";
    print field($rows,"氏名") . "<br>";
}

?>
