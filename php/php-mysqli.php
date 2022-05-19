<?php
// extension=mysqli を有効に
session_cache_limiter('nocache');
session_start();
header( "Content-Type: text/html; Charset=UTF-8" );

require_once("model.php");

// 日本人が PHP 使う前提条件
mb_language('Japanese');
mb_internal_encoding('UTF-8');

// 接続
$server = 'localhost';
$dbname = 'lightbox';
$user = 'root';
$password = '';
$mysqli = @new mysqli($server, $user, $password, $dbname);
if ($mysqli->connect_error) {
    print "接続エラーです : ({$mysqli->connect_errno}) ({$mysqli->connect_error})";
    exit();
}

// クライアントの文字セット
$mysqli->set_charset("utf8"); 

$sql = "SELECT * FROM 社員マスタ";

$result = $mysqli->query($sql);
if ( !$result ) {
    print $mysqli->error;
    exit();
}

// 配列と連想配列が両方取得される
while ($row = $result->fetch_array()) {

    print $row["社員コード"] . " / ";
    print $row["氏名"] . "<br>";

}

?>
