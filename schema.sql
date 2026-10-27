-- Удаление старых таблиц (в обратном порядке, чтобы не нарушить связи)
DROP TABLE IF EXISTS Заказ;
DROP TABLE IF EXISTS Курьер;
DROP TABLE IF EXISTS Клиент;

-- Таблица «Клиент»
CREATE TABLE Клиент (
    id_клиента INTEGER PRIMARY KEY AUTOINCREMENT,
    ФИО TEXT NOT NULL,
    адрес TEXT NOT NULL,
    телефон TEXT NOT NULL
);

-- Таблица «Курьер»
CREATE TABLE Курьер (
    id_курьера INTEGER PRIMARY KEY AUTOINCREMENT,
    ФИО TEXT NOT NULL,
    телефон TEXT NOT NULL,
    зона_обслуживания TEXT NOT NULL,
    статус TEXT NOT NULL DEFAULT 'свободен'
);

-- Таблица «Заказ»
CREATE TABLE Заказ (
    id_заказа INTEGER PRIMARY KEY AUTOINCREMENT,
    id_клиента INTEGER NOT NULL,
    id_курьера INTEGER,
    состав TEXT NOT NULL,
    стоимость REAL NOT NULL,
    дата TEXT NOT NULL,
    статус_доставки TEXT NOT NULL DEFAULT 'Принят',
    адрес_доставки TEXT NOT NULL,
    время_доставки TEXT,
    FOREIGN KEY (id_клиента) REFERENCES Клиент (id_клиента),
    FOREIGN KEY (id_курьера) REFERENCES Курьер (id_курьера)
);