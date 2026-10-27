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