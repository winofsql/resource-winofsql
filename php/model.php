<?php

// キャラクタセット変換
function conv($str,$base) {

    $value = "";

    if ( $base == "cp932" ) {
        $value = mb_convert_encoding($str, "UTF-8", "cp932");
    }
    else {
        $value = mb_convert_encoding($str, "cp932", "UTF-8");
    }

    return $value;
}

// キャラクタセット変換(列名による取得)
function field($rows,$str) {

    $value = conv($rows[conv($str, "UTF-8")], "cp932");

    return $value;
}

function field_s3($rows,$str) {

    $value = $rows[conv($str, "UTF-8")];

    return $value;
}
?>