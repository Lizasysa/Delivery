-- =========================================================
-- Удаление старых таблиц (в обратном порядке)
-- =========================================================
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Courier;
DROP TABLE IF EXISTS Operator;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS UserRole;

-- =========================================================
-- 1. Создание таблиц
-- =========================================================

-- Таблица ролей (справочник)
CREATE TABLE UserRole (
    roleID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Главная таблица пользователей (содержит общие данные)
CREATE TABLE User (
    userID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    balance REAL DEFAULT 0.0,
    roleID INTEGER NOT NULL,
    FOREIGN KEY (roleID) REFERENCES UserRole (roleID)
);

-- Таблица Клиентов (наследуется от User)
CREATE TABLE Client (
    clientID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL UNIQUE,
    address TEXT NOT NULL,
    phone TEXT NOT NULL,
    FOREIGN KEY (userID) REFERENCES User (userID) ON DELETE CASCADE
);

-- Таблица Курьеров (наследуется от User)
CREATE TABLE Courier (
    courierID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL UNIQUE,
    phone TEXT NOT NULL,
    vehicle TEXT NOT NULL,
    FOREIGN KEY (userID) REFERENCES User (userID) ON DELETE CASCADE
);

-- Таблица Операторов (наследуется от User)
CREATE TABLE Operator (
    operatorID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL UNIQUE,
    phone TEXT NOT NULL,
    position TEXT NOT NULL,
    FOREIGN KEY (userID) REFERENCES User (userID) ON DELETE CASCADE
);
INSERT INTO UserRole (name) VALUES
('Клиент'),
('Курьер'),
('Оператор');

-- Заполнение таблицы «Клиент»
INSERT INTO User (name, surname, email, password_hash, balance, roleID) VALUES
('Иван', 'Иванов', 'client@mail.ru', 'hash_123', 1500.50, 1),  -- Клиент
('Пётр', 'Сидоров', 'courier@mail.ru', 'hash_456', 0.0, 2),    -- Курьер
('Анна', 'Смирнова', 'operator@mail.ru', 'hash_789', 0.0, 3);  -- Оператор

-- Заполнение таблицы «Курьер»
INSERT INTO Client (userID, address, phone) VALUES
(1, 'г. Москва, ул. Ленина, д. 5', '+7-900-111-22-33');

-- Заполнение таблицы «Заказ»
INSERT INTO Courier (userID, phone, vehicle) VALUES
(2, '+7-900-444-55-66', 'Автомобиль (Лада)');

INSERT INTO Operator (userID, phone, position) VALUES
(3, '+7-900-777-88-99', 'Старший оператор');