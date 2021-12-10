-- 複数行のグループデータを1行にまとめるSQL
CREATE TABLE data (
    コード int,
    行 int,
    内容 varchar(50),
    PRIMARY KEY (コード, 行)
);

SELECT
    コード,
    CASE
        行
        WHEN 1 THEN 内容
        ELSE NULL
    END AS 内容1,
    CASE
        行
        WHEN 2 THEN 内容
        ELSE NULL
    END AS 内容2,
    CASE
        行
        WHEN 3 THEN 内容
        ELSE NULL
    END AS 内容3
FROM
    data;

SELECT
    コード,
    max(
        CASE
            行
            WHEN 1 THEN 内容
            ELSE NULL
        END
    ) AS 内容1,
    max(
        CASE
            行
            WHEN 2 THEN 内容
            ELSE NULL
        END
    ) AS 内容2,
    max(
        CASE
            行
            WHEN 3 THEN 内容
            ELSE NULL
        END
    ) AS 内容3
FROM
    data
GROUP BY
    コード;

SELECT
    氏名,
    CASE
        性別
        WHEN 0 THEN '男性'
        WHEN 1 THEN '女性'
        ELSE '不明'
    END AS 性別
FROM
    社員マスタ;
