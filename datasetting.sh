#!/bin/bash

# Hành động 1: Thêm data vào cơ sở dữ liệu MySQL
# Lấy thông tin kết nối từ file .env
DB_HOST=$(grep 'DB_HOST=' .env | cut -d'=' -f2)
DB_PORT=$(grep 'DB_PORT=' .env | cut -d'=' -f2)
DB_USERNAME=$(grep 'DB_USERNAME=' .env | cut -d'=' -f2)
DB_PASSWORD=$(grep 'DB_PASSWORD=' .env | cut -d'=' -f2)
DB_NAME=$(grep 'DB_DATABASE=' .env | cut -d'=' -f2)

# Tạo database
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USERNAME" -p"$DB_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Chạy lệnh MySQL để thực hiện script
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USERNAME" -p"$DB_PASSWORD" "$DB_NAME" < database/scripts/runner.sql

# Hành động 2: Tạo symbolic link hoặc junction
# Lấy đường dẫn gốc của folder chứa script
SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Kiểm tra hệ điều hành
if [[ "$(uname)" == "Darwin" ]]; then
  # Mac OS
  ln -s "$SCRIPT_DIR/storage/app/public" "$SCRIPT_DIR/public/storage"
else
  # Windows
  cmd /c mklink /D "$SCRIPT_DIR\storage\app\public" "$SCRIPT_DIR\public\storage"
fi
