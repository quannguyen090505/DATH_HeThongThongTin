from fastapi import Depends, HTTPException, Security
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
import bcrypt
import jwt
from datetime import datetime, timedelta

security = HTTPBearer()
SECRET_KEY = "dath_hethongthongtin"
ALGORITHM = "HK252"
ACCESS_TOKEN_EXPIRE_MINUTES = 60 * 24


def get_password_hash(password: str) -> str:
    """Dùng khi Đăng ký / Tạo mới User (Sử dụng trực tiếp thư viện bcrypt)"""
    password_bytes = password.encode('utf-8')
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password_bytes, salt)
    return hashed.decode('utf-8')


def verify_password(plain_password: str, hashed_password: str) -> bool:
    """Dùng khi Đăng nhập (Sử dụng trực tiếp thư viện bcrypt)"""
    password_bytes = plain_password.encode('utf-8')
    hashed_bytes = hashed_password.encode('utf-8')
    try:
        return bcrypt.checkpw(password_bytes, hashed_bytes)
    except Exception:
        return False


def create_access_token(user_id: int, role: str):
    """Tạo thẻ VIP (Token) chứa ID và Quyền (Khách hay Nhân Viên)"""
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)

    # BÍ KÍP: Nhét cả Role vào payload để biết ai đang gọi API
    payload = {
        "sub": str(user_id),
        "role": role,
        "exp": expire,
    }
    encoded_jwt = jwt.encode(payload, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


def kiem_tra_quyen_quan_ly(
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    """Hàm này sẽ bóc Token do Frontend gửi lên để kiểm tra"""
    token = credentials.credentials
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])

        user_id = payload.get("sub")
        role = payload.get("role")

        if role != 'QuanLy':
            raise HTTPException(
                status_code=403, detail="Chỉ quản lý mới có quyền gọi API này!"
            )
        return int(user_id)
    except jwt.ExpiredSignatureError:
        raise HTTPException(
            status_code=401, detail="Token đã hết hạn, vui lòng đăng nhập lại"
        )
    except jwt.InvalidTokenError:
        raise HTTPException(status_code=401, detail="Token không hợp lệ")


def kiem_tra_quyen_nhan_vien(
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    """Hàm này sẽ bóc Token do Frontend gửi lên để kiểm tra"""
    token = credentials.credentials
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])

        user_id = payload.get("sub")
        role = payload.get("role")

        if role == 'Khach':
            raise HTTPException(
                status_code=403, detail="Chỉ nhân viên mới có quyền gọi API này!"
            )
        return int(user_id)
    except jwt.ExpiredSignatureError:
        raise HTTPException(
            status_code=401, detail="Token đã hết hạn, vui lòng đăng nhập lại"
        )
    except jwt.InvalidTokenError:
        raise HTTPException(status_code=401, detail="Token không hợp lệ")
