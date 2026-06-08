import mysql.connector
from mysql.connector import Error


def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            database="DATH_HeThongThongTin",  # Đổi lại tên DB
            user="root",
            password="77882^66Quan",  # Đổi lại mật khẩu MySQL đang dùng

        )
        return connection
    except Error as e:
        print(f"Lỗi kết nối MySQL: {e}")
        return None
