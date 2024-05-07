
CREATE TABLE IF NOT EXISTS tiker
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    name_tiker VARCHAR(255) NOT NULL,
    deal_place VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS fin_asset
(
    id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    tiker_id          BIGINT NOT NULL ,
    registration      VARCHAR(255) NOT NULL,
    data_registration DATE NOT NULL,
    emitent           VARCHAR(255) NOT NULL,
    form_issue        VARCHAR(255) NOT NULL,
    principal         NUMERIC(20, 2) NOT NULL,
    amount            INTEGER NOT NULL,
    FOREIGN KEY (tiker_id) REFERENCES tiker (id)
);

CREATE TABLE IF NOT EXISTS security
(
    id                 BIGINT AUTO_INCREMENT PRIMARY KEY,
    fin_asset_id       BIGINT NOT NULL ,
    date_accommodation DATE NOT NULL,
    date_report        DATE NOT NULL,
    FOREIGN KEY (fin_asset_id) REFERENCES fin_asset (id)
);

CREATE TABLE IF NOT EXISTS bond
(
    id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    fin_asset_id   BIGINT NOT NULL ,
    data_repayment DATE NOT NULL,
    coupons_amount INTEGER NOT NULL,
    coupons_rate   NUMERIC(20, 2) NOT NULL,
    FOREIGN KEY (fin_asset_id) REFERENCES fin_asset (id)
);

INSERT INTO tiker (name_tiker, deal_place) VALUES ('AAPL', 'NASDAQ');
INSERT INTO tiker (name_tiker, deal_place) VALUES ('GOOGL', 'NASDAQ');

INSERT INTO fin_asset (tiker_id, registration, data_registration, emitent, form_issue, principal, amount) VALUES (1, 'SEC', '2023-01-15', 'Apple Inc.', 'Наличная', 100.00, 1000);
INSERT INTO fin_asset (tiker_id, registration, data_registration, emitent, form_issue, principal, amount) VALUES (2, 'FCA', '2022-12-20', 'Alphabet Inc.', 'Безналичная', 50.00, 2000);

INSERT INTO security (fin_asset_id, date_accommodation, date_report) VALUES (1, '2023-01-16', '2023-01-17');
INSERT INTO security (fin_asset_id, date_accommodation, date_report) VALUES (2, '2022-12-21', '2022-12-22');

INSERT INTO bond (fin_asset_id, data_repayment, coupons_amount, coupons_rate) VALUES (1, '2024-01-15', 4, 5.00);
INSERT INTO bond (fin_asset_id, data_repayment, coupons_amount, coupons_rate) VALUES (2, '2024-02-20', 8, 4.50);
