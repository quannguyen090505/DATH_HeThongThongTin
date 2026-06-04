// src/store.js
import { create } from "zustand";

export const useTempStore = create((set) => ({
  PhieuGoiMon: [],

  ThemMon: (monAn) =>
    set((state) => {
      const maMon = monAn.MaMon !== undefined ? monAn.MaMon : monAn.MaMonAn;
      if (maMon === undefined) return state;

      const monChuan = {
        ...monAn,
        MaMon: maMon,
        TenMon: monAn.TenMon,
        DonGia: monAn.DonGia,
        HinhAnh: monAn.HinhAnh,
      };

      const kiemtra = state.PhieuGoiMon.find(
        (item) => item.MaMon === maMon,
      );

      if (kiemtra) {
        return {
          PhieuGoiMon: state.PhieuGoiMon.map((item) =>
            item.MaMon === maMon
              ? { ...item, SoLuong: item.SoLuong + 1 }
              : item,
          ),
        };
      }
      return { PhieuGoiMon: [...state.PhieuGoiMon, { ...monChuan, SoLuong: 1 }] };
    }),

  XoaMon: (maMonOrObject) =>
    set((state) => {
      const maMon = (maMonOrObject && typeof maMonOrObject === "object") 
        ? (maMonOrObject.MaMon !== undefined ? maMonOrObject.MaMon : maMonOrObject.MaMonAn)
        : maMonOrObject;
      return {
        PhieuGoiMon: state.PhieuGoiMon.filter(
          (item) => item.MaMon !== maMon,
        ),
      };
    }),

  TangSoLuong: (maMonOrObject) =>
    set((state) => {
      const maMon = (maMonOrObject && typeof maMonOrObject === "object") 
        ? (maMonOrObject.MaMon !== undefined ? maMonOrObject.MaMon : maMonOrObject.MaMonAn)
        : maMonOrObject;
      return {
        PhieuGoiMon: state.PhieuGoiMon.map((item) =>
          item.MaMon === maMon
            ? { ...item, SoLuong: item.SoLuong + 1 }
            : item,
        ),
      };
    }),

  GiamSoLuong: (maMonOrObject) =>
    set((state) => {
      const maMon = (maMonOrObject && typeof maMonOrObject === "object") 
        ? (maMonOrObject.MaMon !== undefined ? maMonOrObject.MaMon : maMonOrObject.MaMonAn)
        : maMonOrObject;
      return {
        PhieuGoiMon: state.PhieuGoiMon.map((item) =>
          item.MaMon === maMon
            ? { ...item, SoLuong: Math.max(1, item.SoLuong - 1) }
            : item,
        ),
      };
    }),

  CapNhatSoLuong: (maMonOrObject, soLuong) =>
    set((state) => {
      const maMon = (maMonOrObject && typeof maMonOrObject === "object") 
        ? (maMonOrObject.MaMon !== undefined ? maMonOrObject.MaMon : maMonOrObject.MaMonAn)
        : maMonOrObject;
      const validSoLuong = Math.max(1, parseInt(soLuong) || 1);
      return {
        PhieuGoiMon: state.PhieuGoiMon.map((item) =>
          item.MaMon === maMon
            ? { ...item, SoLuong: validSoLuong }
            : item,
        ),
      };
    }),

  XoaPhieuGoiMon: () => set({ PhieuGoiMon: [] }),
}));
