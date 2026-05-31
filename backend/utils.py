from fastapi import HTTPException
import mysql.connector


def error_complier(error: mysql.connector.Error):
    error_code = error.errno
    if error_code == 1644:
        message = error.msg
    elif error_code == 3819:
        # Lỗi CHECK Constraint
        if "banan_chk_1" in error.msg:
            message = "Lỗi: Số lượng chỗ ngồi phải lớn hon 0!"
        elif "monduocgoi_chk_2" in error.msg:
            message = "Lỗi: Số lượng món được gọi phải lớn hơn 0."
        elif "nhanvien_chk_1" in error.msg:
            message = "Lỗi: Mức lương phải lớn hơn 0!"
        elif "phieudatban_chk_1" in error.msg:
            message = "Lỗi: Ngày giờ nhận bàn phải sau ngày giờ hiện tại."
        elif "phieunhapkho_chk_1" in error.msg:
            message = "Lỗi: Giá trị phiếu nhập kho phải lớn hơn 0."
    elif error_code == 1062:
        # Lỗi UNIQUE (Trùng lặp)
        message = "Lỗi: Dữ liệu này (SĐT hoặc Email) đã tồn tại trong hệ thống."
    elif error_code == 1452:
        # Lỗi Khóa ngoại (Tham chiếu sai)
        if "banan_ibfk_1" in error.msg:
            message = " Lỗi: Mã chi nhánh không hợp lệ."
        elif "cungcapthucdon_ibfk_1" in error.msg:
            message = "Lỗi: Mã chi nhánh không hợp lệ."
        elif "cungcapthucdon_ibfk_2" in error.msg:
            message = "Lỗi: Mã món ăn không hợp lệ."
        elif "dattruocmon_ibfk_1" in error.msg:
            message = "Lỗi: Mã phiếu đặt bàn không hợp lệ."
        elif "dattruocmon_ibfk_2" in error.msg:
            message = "Lỗi: Mã phiếu gọi món không hợp lệ."
        elif "hoadon_ibfk_1" in error.msg:
            message = "Lỗi: Mã phiếu gọi món không hợp lệ."
        elif "hoadon_ibfk_2" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
        elif "monan_ibfk_1" in error.msg:
            message = "Lỗi: Mã thể loại món không hợp lệ."
        elif "goimon_ibfk_1" in error.msg:
            message = "Lỗi: Mã bàn ăn không hợp lệ."
        elif "goimon_ibfk_2" in error.msg:
            message = "Lỗi: Mã phiếu gọi món không hợp lệ."
        elif "nguoiquanly_ibfk_1" in error.msg:
            message = "Lỗi: Mã người quản lý không hợp lệ."
        elif "nhanvien_ibfk_1" in error.msg:
            message = "Lỗi: Mã chi nhánh không hợp lệ."
        elif "phieudatban_ibfk_1" in error.msg:
            message = "Lỗi: Mã bàn ăn không hợp lệ."
        elif "phieudatban_ibfk_2" in error.msg:
            message = "Lỗi: Sđt khách không hợp lệ."
        elif "phieudatban_ibfk_3" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
        elif "phieugoimon_ibfk_1" in error.msg:
            message = "Lỗi: Mã bàn ăn không hợp lệ."
        elif "phieugoimon_ibfk_2" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
        elif "phieugoimon_ibfk_3" in error.msg:
            message = "Lỗi: Sđt khách không hợp lệ."
        elif "phieunhapkho_ibfk_1" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
    else:
        # Bắt các lỗi hệ thống khác
        message = f"Lỗi cơ sở dữ liệu ({error_code}): {error.msg}"
    raise HTTPException(status_code=400, detail=message)
