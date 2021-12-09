SELECT
    氏名
FROM
    社員マスタ
WHERE
    性別 = 0
    AND 給与 >= 250000
UNION
SELECT
    氏名
FROM
    社員マスタ
WHERE
    性別 = 1
    AND 給与 >= 250000
UNION
SELECT
    氏名
FROM
    社員マスタ
WHERE
    給与 <= 200000;