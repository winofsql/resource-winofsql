-- あれば更新、無ければ新規
REPLACE INTO 社員マスタ (
    社員コード,
    氏名,
    フリガナ,
    所属,
    性別,
    作成日,
    更新日,
    給与,
    手当,
    生年月日
)
VALUES
    (
        '0001',
        '浦岡 友也',
        'ウラオカ トモヤ',
        '0003',
        0,
        '2005/09/12',
        '2005/11/28',
        270000,
        9000,
        '2000/01/01'
    );