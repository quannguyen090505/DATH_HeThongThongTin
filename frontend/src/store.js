// src/store.js
import { create } from "zustand";

export const useTempStore = create((set) => ({
  PhieuGoiMon: [],

  ThemMon: (monAn) =>
    set((state) => {
      const kiemtra = state.PhieuGoiMon.find(
        (item) => item.MaMon === monAn.MaMon,
      );
      if (kiemtra) {
        return {
          PhieuGoiMon: state.PhieuGoiMon.map((item) =>
            item.MaMon === monAn.MaMon
              ? { ...item, SoLuong: item.SoLuong + 1 }
              : item,
          ),
        };
      }
      return { PhieuGoiMon: [...state.PhieuGoiMon, { ...monAn, SoLuong: 1 }] };
    }),

  XoaMon: (monAn) =>
    set((state) => ({
      PhieuGoiMon: state.PhieuGoiMon.filter(
        (item) => item.MaMon !== monAn.MaMon,
      ),
    })),

  TangSoLuong: (monAn) =>
    set((state) => ({
      PhieuGoiMon: state.PhieuGoiMon.map((item) =>
        item.MaMon === monAn.MaMon
          ? { ...item, SoLuong: item.SoLuong + 1 }
          : item,
      ),
    })),

  GiamSoLuong: (monAn) =>
    set((state) => ({
      PhieuGoiMon: state.PhieuGoiMon.map((item) =>
        item.MaMon === monAn.MaMon
          ? { ...item, SoLuong: Math.max(1, item.SoLuong - 1) }
          : item,
      ),
    })),
  XoaPhieuGoiMon: () => set({ PhieuGoiMon: [] }),
}));
