import axios from "axios";

const api = axios.create({
  baseURL: "http://localhost:8000", // Port của FastAPI
});

api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("token_nhan_vien");
    if (token) {
      config.headers["Authorization"] = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  },
);

export default api;
