import mysql.connector
from mysql.connector import Error


def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host="...",
            database="...",  # Đổi lại tên DB
            user="root",
            password="...",  # Đổi lại mật khẩu MySQL đang dùng
        )
        return connection
    except Error as e:
        print(f"Lỗi kết nối MySQL: {e}")
        return None
