SELECT
    *
FROM
    INFORMATION_SCHEMA.VIEWS;

-- v_社員一覧
SELECT
    社員マスタ.社員コード,
    社員マスタ.氏名,
    社員マスタ.フリガナ,
    名称1.名称 AS 性別,
    社員マスタ.所属,
    名称2.名称 AS 所属名
FROM
    社員マスタ
    LEFT OUTER JOIN コード名称マスタ 名称1
    ON 
        社員マスタ.性別 = 名称1.コード
        AND 名称1.区分 = 1
    LEFT OUTER JOIN コード名称マスタ 名称2
    ON
        社員マスタ.所属 = 名称2.コード
        AND 名称2.区分 = 2;

-- v_得意先台帳
SELECT
    取引データ.取引先コード,
    得意先マスタ.得意先名,
    取引データ.取引日付,
    取引データ.取引区分,
    取引データ.伝票番号,
    取引データ.行,
    取引データ.商品コード,
    商品マスタ.商品名,
    取引データ.数量,
    取引データ.単価,
    取引データ.金額
FROM
    取引データ
    LEFT OUTER JOIN 商品マスタ ON 取引データ.商品コード = 商品マスタ.商品コード
    LEFT OUTER JOIN 得意先マスタ ON 取引データ.取引先コード = 得意先マスタ.得意先コード
WHERE
    取引データ.取引区分 = '10';

-- v_売上日付
SELECT
    コントロールマスタ.売上日付
FROM
    コントロールマスタ
WHERE
    コントロールマスタ.キー = '1';

-- v_商品一覧
SELECT
    商品マスタ.商品コード,
    商品マスタ.商品名,
    商品マスタ.販売単価,
    商品分類マスタ.商品分類,
    商品分類マスタ.名称 AS 分類名,
    商品マスタ.商品区分,
    コード名称マスタ.名称 AS 区分名
FROM
    商品マスタ
    LEFT JOIN 商品分類マスタ ON 商品マスタ.商品分類 = 商品分類マスタ.商品分類
    LEFT JOIN コード名称マスタ ON 商品マスタ.商品区分 = コード名称マスタ.コード
    AND コード名称マスタ.区分 = 3
WHERE
    商品マスタ.削除フラグ IS NULL