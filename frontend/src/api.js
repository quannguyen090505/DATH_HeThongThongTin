import axios from "axios";

const api = axios.create({
  //baseURL: "http://localhost:8000", // Port của FastAPI
  baseURL: "https://linguist-gazing-defensive.ngrok-free.dev",
});

api.interceptors.request.use(
  (config) => {
    config.headers["ngrok-skip-browser-warning"] = "true";
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
