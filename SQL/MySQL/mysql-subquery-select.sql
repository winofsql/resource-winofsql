-- 相関副問合せ
SELECT
    社員マスタ.社員コード,
    社員マスタ.氏名,
    (
        SELECT
            count(*)
        FROM
            得意先マスタ
        WHERE
            得意先マスタ.担当者 = 社員マスタ.社員コード
    ) AS 件数
FROM
    社員マスタ;