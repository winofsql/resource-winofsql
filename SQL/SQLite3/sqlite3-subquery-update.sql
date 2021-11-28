CREATE TABLE 社員マスタ_名称(
    社員コード varchar(4) PRIMARY KEY,
    氏名 varchar(50),
    フリガナ varchar(50),
    所属 varchar(4),
    所属名 varchar(50),
    性別 integer,
    給与 integer,
    手当 integer,
    管理者 varchar(4),
    管理者名 varchar(50),
    生年月日 timestamp
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