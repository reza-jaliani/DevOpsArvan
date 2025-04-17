# 🐳 آموزش کامل Docker به زبان ساده

این داکیومنت مرجع سریع و کاربردی برای شروع یادگیری Docker است. شامل مفاهیم پایه، دستورات مهم، ساخت ایمیج، مدیریت کانتینر، ولوم، شبکه و Docker Compose می‌باشد.

---

## 🔹 مفاهیم پایه‌ای

- **Image**: الگوی فقط‌خواندنی شامل تمام فایل‌های موردنیاز برای اجرای برنامه.
- **Container**: نسخه اجرایی یک Image، محیطی ایزوله‌شده.
- **Dockerfile**: فایلی متنی برای تعریف مراحل ساخت Image.
- **Volume**: فضایی برای ذخیره دائمی داده‌ها بین کانتینرها.
- **Network**: شبکه مجازی برای ارتباط بین کانتینرها.
- **Docker Hub**: رجیستری عمومی برای اشتراک‌گذاری Imageها.

---

## 🔧 نصب Docker

### روی Ubuntu:
```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable --now docker
```

---

## ⚙️ دستورات پایه

### بررسی وضعیت:
```bash
docker --version
docker info
```

### کار با کانتینرها:
```bash
docker run hello-world                      # تست نصب
docker ps                                   # لیست کانتینرهای فعال
docker ps -a                                # همه کانتینرها
docker start <id>                           # شروع کانتینر
docker stop <id>                            # توقف کانتینر
docker rm <id>                              # حذف کانتینر
docker logs <id>                            # مشاهده لاگ‌ها
docker exec -it <id> bash                   # ورود به bash
```

### کار با ایمیج‌ها:
```bash
docker images                               # لیست ایمیج‌ها
docker rmi <image_id>                       # حذف ایمیج
docker pull ubuntu                          # دریافت ایمیج
docker inspect <image_or_container_id>      # بررسی جزئیات
```

---

## 🧱 ساخت Image با Dockerfile

**ساخت ساده Node.js:**

`Dockerfile`:
```Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["node", "server.js"]
```

سپس:
```bash
docker build -t my-node-app .
docker run -p 3000:3000 my-node-app
```

---

## 📂 استفاده از .dockerignore
برای جلوگیری از کپی فایل‌های غیرضروری به Image:
```
node_modules
*.log
.env
```

---

## 🗂️ مدیریت Volume

### ایجاد و استفاده:
```bash
docker volume create mydata
docker run -v mydata:/app/data ubuntu
```

### مشاهده و حذف:
```bash
docker volume ls
docker volume inspect mydata
docker volume rm mydata
```

---

## 🌐 مدیریت Network

### ایجاد و اتصال:
```bash
docker network create mynet
docker run -dit --name db --network=mynet mysql
docker run -dit --name app --network=mynet myapp
```

---

## 🧩 Docker Compose

`docker-compose.yml`:
```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "3000:3000"
  db:
    image: mongo
```

سپس:
```bash
docker compose up --build
docker compose down
```

---

## 🔐 Docker Registry (Optional)

### لاگین و ارسال به Docker Hub:
```bash
docker login
docker tag myapp username/myapp:latest
docker push username/myapp:latest
```

---

## 🧹 پاک‌سازی منابع اضافی

```bash
docker container prune
docker image prune
docker volume prune
docker system prune -a
```

---

🟢 با اجرای این دستورات و مفاهیم، می‌تونی تقریباً هر پروژه‌ای رو داکرایز کنی!