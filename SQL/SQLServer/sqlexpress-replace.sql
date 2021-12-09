-- あれば更新、無ければ新規
-- この拡張では実行できない
-- SQLの窓の 『実行ボタン』で実行
MERGE INTO 社員マスタ AS target USING (
    SELECT
        '0001' AS 社員コード,
        '浦岡 友也' AS 氏名,
        'ウラオカ トモヤ' AS フリガナ,
        '0003' AS 所属,
        0 AS 性別,
        '2005/09/12' AS 作成日,
        '2005/11/28' AS 更新日,
        270000 AS 給与,
        9000 AS 手当,
        NULL AS 管理者,
        '2000/01/01' AS 生年月日
) AS source ON (target.社員コード = source.社員コード)
WHEN MATCHED THEN
UPDATE
SET
    氏名 = source.氏名,
    フリガナ = source.フリガナ,
        所属= source.所属,
        性別= source.性別,
        作成日= source.作成日,
        更新日= source.更新日,
        給与= source.給与,
        手当= source.手当,
        管理者= source.管理者,
        生年月日= source.生年月日
    WHEN NOT MATCHED THEN
INSERT
    (
        社員コード,
        氏名,
        フリガナ,
        所属,
        性別,
        作成日,
        更新日,
        給与,
        手当,
        管理者,
        生年月日
    )
VALUES
    (
        source.社員コード,
        source.氏名,
        source.フリガナ,
        source.所属,
        source.性別,
        source.作成日,
        source.更新日,
        source.給与,
        source.手当,
        source.管理者,
        source.生年月日
    );
;