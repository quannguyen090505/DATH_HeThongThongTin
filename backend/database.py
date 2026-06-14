import mysql.connector
from mysql.connector import Error


def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            database="dath_hethongthongtin",
            user="dungpham",
            password="123",

        )
        return connection
    except Error as e:
        print(f"Lỗi kết nối MySQL: {e}")
        return None
