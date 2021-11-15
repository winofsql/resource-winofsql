SELECT
    *
FROM
    sqlite_master
WHERE
    TYPE = 'table'
    AND name = 'コード名称マスタ';

CREATE TABLE "コード名称マスタ"(
    "区分" integer,
    "コード" varchar(10),
    "名称" varchar(50),
    "数値1" integer,
    "数値2" integer,
    "作成日" timestamp,
    "更新日" timestamp,
    PRIMARY KEY("区分", "コード")
);

CREATE TABLE "コントロールマスタ"(
    "キー" varchar(1) PRIMARY KEY,
    "売上日付" timestamp,
    "売上伝票" integer,
    "会社名" varchar(50),
    "組織コード" varchar(4),
    "起算月" float
);

CREATE TABLE "メッセージマスタ"(
    "コード" varchar(4) PRIMARY KEY,
    "メッセージ" varchar(100)
);

CREATE TABLE "社員マスタ"(
    "社員コード" varchar(4) PRIMARY KEY,
    "氏名" varchar(50),
    "フリガナ" varchar(50),
    "所属" varchar(4),
    "性別" integer,
    "作成日" timestamp,
    "更新日" timestamp,
    "給与" integer,
    "手当" integer,
    "管理者" varchar(4),
    "生年月日" timestamp
);

CREATE TABLE "社員変更履歴"(
    "社員コード" varchar(4) PRIMARY KEY,
    "氏名" varchar(50),
    "フリガナ" varchar(50),
    "所属" varchar(4),
    "性別" integer,
    "作成日" timestamp,
    "更新日" timestamp,
    "給与" integer,
    "手当" integer,
    "管理者" varchar(4),
    "生年月日" timestamp
);

CREATE TABLE "取引データ"(
    "取引区分" varchar(2),
    "伝票番号" integer,
    "行" integer,
    "取引日付" timestamp,
    "取引先コード" varchar(4),
    "商品コード" varchar(4),
    "数量" integer,
    "単価" integer,
    "金額" integer,
    "更新済" varchar(1),
    PRIMARY KEY("取引区分", "伝票番号", "行")
);

CREATE TABLE "商品マスタ"(
    "商品コード" varchar(4) PRIMARY KEY,
    "商品名" varchar(50),
    "在庫評価単価" integer,
    "販売単価" integer,
    "商品分類" varchar(3),
    "商品区分" varchar(1),
    "作成日" timestamp,
    "更新日" timestamp,
    "備考" longvarchar(65536),
    "削除フラグ" varchar(1)
);

CREATE TABLE "商品集計"(
    "商品コード" varchar(4),
    "経過月" float,
    "当月売上数量" float,
    "当月売上金額" float,
    "更新日" timestamp,
    "組織コード" varchar(4),
    PRIMARY KEY("商品コード", "経過月")
);

CREATE TABLE "商品分類マスタ"(
    "商品分類" varchar(3) PRIMARY KEY,
    "名称" varchar(50),
    "作成日" timestamp,
    "更新日" timestamp
);

CREATE TABLE "得意先マスタ"(
    "得意先コード" varchar(4) PRIMARY KEY,
    "得意先名" varchar(50),
    "得意先区分" varchar(1),
    "担当者" varchar(4),
    "郵便番号" varchar(7),
    "住所１" varchar(100),
    "住所２" varchar(100),
    "作成日" timestamp,
    "更新日" timestamp,
    "締日" integer,
    "締日区分" integer,
    "支払日" integer,
    "備考" varchar(100)
);

CREATE TABLE "得意先集計"(
    "請求先" varchar(4),
    "経過月" float,
    "当月売上金額" float,
    "更新日" timestamp,
    "組織コード" varchar(4),
    PRIMARY KEY("請求先", "経過月")
);

CREATE TABLE "入金予定データ"(
    "得意先コード" varchar(4) PRIMARY KEY,
    "支払日" timestamp,
    "伝票合計金額" float,
    "伝票番号" float
);

CREATE TABLE "郵便番号マスタ"(
    "郵便番号" varchar(7),
    "都道府県名カナ" varchar(255),
    "市区町村名カナ" varchar(255),
    "町域名カナ" varchar(255),
    "都道府県名" varchar(255),
    "市区町村名" varchar(255),
    "町域名" varchar(255)
);
