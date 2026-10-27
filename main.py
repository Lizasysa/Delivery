import sqlite3

# Подключение к базе данных (файл создастся автоматически)
conn = sqlite3.connect('delivery.db')
cursor = conn.cursor()
import sqlite3
import os

DB_NAME = 'delivery.db'
SCHEMA_FILE = 'schema.sql'
DATA_FILE = 'data.sql'


def create_database():
    """Создание структуры БД из schema.sql"""
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    with open(SCHEMA_FILE, 'r', encoding='utf-8') as f:
        cursor.executescript(f.read())

    conn.commit()
    conn.close()
    print("✅ Структура БД создана.")







if __name__ == '__main__':
    conn.close()
    # Удаляем старую БД, если есть
    if os.path.exists(DB_NAME):
        os.remove(DB_NAME)

    create_database()


    print("\n🎉 Готово! База данных создана и заполнена.")
