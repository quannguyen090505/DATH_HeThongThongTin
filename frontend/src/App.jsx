import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import TrangChu from "./TrangChu";
import TrangDatMon from "./TrangDatMon";
import DangNhapNoiBo from "./DangNhapNoiBo";
import HoatDongNhanVien from "./HoatDongNhanVien";
import HoatDongQuanLy from "./HoatDongQuanLy";
import PhieuGoiMonTab from "./PhieuGoiMonTab";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<TrangChu />} />
        <Route path="/dat-mon" element={<TrangDatMon />} />
        <Route path="/dang-nhap-noi-bo" element={<DangNhapNoiBo />} />
        <Route path="/nhan-vien/phuc-vu" element={<HoatDongNhanVien />} />
        <Route path="/quan-ly/dashboard" element={<HoatDongQuanLy />} />
      </Routes>
    </Router>
  );
}
export default App;
