CREATE TABLE 社員マスタ_名称 (
    社員コード NVARCHAR(4),
    氏名 NVARCHAR(50),
    フリガナ NVARCHAR(50),
    所属 NVARCHAR(4),
    所属名 NVARCHAR(50),
    性別 INT,
    給与 INT,
    手当 INT,
    管理者 NVARCHAR(4),
    管理者名 NVARCHAR(50),
    生年月日 DATETIME,
    PRIMARY KEY(社員コード)
);

-- 相関副問合せ
UPDATE
    社員マスタ_名称
SET
    所属名 = (
        SELECT
            名称
        FROM
            コード名称マスタ
        WHERE
            社員マスタ_名称.所属 = コード名称マスタ.コード
            AND コード名称マスタ.区分 = 2
    );

UPDATE
    社員マスタ_名称
SET
    管理者名 = (
        SELECT
            氏名
        FROM
            社員マスタ
        WHERE
            社員マスタ_名称.管理者 = 社員マスタ.社員コード
    );