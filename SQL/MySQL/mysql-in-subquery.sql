-- 売上額 400万以上の得意先の担当者の一覧
SELECT
    *
FROM
    社員マスタ
WHERE
    社員コード IN (
        SELECT
            担当者
        FROM
            得意先マスタ
        WHERE
            得意先コード IN (
                SELECT
                    取引先コード
                FROM
                    取引データ
                GROUP BY
                    取引先コード
                HAVING
                    sum(金額) >= 4000000
            )
    )
