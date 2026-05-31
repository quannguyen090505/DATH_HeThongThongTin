from fastapi import Depends, HTTPException, Security
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from passlib.context import CryptContext
import jwt
from datetime import datetime, timedelta

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

security = HTTPBearer()
SECRET_KEY = "dath_hethongthongtin"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60 * 24


def get_password_hash(password: str):
    """Dùng khi Đăng ký / Tạo mới User"""
    return pwd_context.hash(password)


def verify_password(plain_password: str, hashed_password: str):
    """Dùng khi Đăng nhập"""
    return pwd_context.verify(plain_password, hashed_password)


def create_access_token(user_id: int, role: str):
    """Tạo thẻ VIP (Token) chứa ID và Quyền (Khách hay Nhân Viên)"""
    expire = datetime.now() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)

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

        if role == 'Khach"':
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
