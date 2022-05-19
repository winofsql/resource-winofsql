<?php
// extension=php_com_dotnet.dll を記述
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

require_once("model.php");

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

$hanbai = mb_convert_encoding("販売管理", "cp932", "UTF-8");

$cn = new COM( "ADODB.Connection" );
$cn->CursorLocation = 3;
$rs = new COM( "ADODB.Recordset" );

$ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;";
$ConnectionString .= "Data Source=C:\\app\\workspace\\{$hanbai}.accdb;";

$cn->Open( $ConnectionString );

// キャラクタセット変換
$sql = conv("SELECT * FROM 社員マスタ", "UTF-8");
$rs->Open( $sql, $cn );

while( !$rs->EOF ) {

    print $rs->fields(conv("社員コード", "UTF-8"))->value . " / ";
    print conv($rs->fields(conv("氏名", "UTF-8"))->value, "cp932" ) . "<br>";

    $rs->MoveNext();

}
?>
