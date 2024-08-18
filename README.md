<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

### Hướng dẫn cài đặt

> Bước 1 Tạo cơ sở dữ liệu mẫu

-   Tạo mới database `ecommerceadvlara` trong mysql
-   Chạy file sql mới nhất trong thư mục `/database/scripts` để tạo mới các table và data trong database vừa mới tạo
-   Sau khi chạy xong hãy kiểm tra lại đã có data hay chưa

> Bước 2 Cấu hình lại file `.env`

-   Thay đổi cấu hình kết nối database
-   Thay đổi `APP_URL` bằng `APP_URL` trên máy tính của bạn, nếu không config chính xác chỗ này sẽ gây ra lỗi ở các link tài nguyên, đặc biệt là link image.

> Bước 3 Khởi chạy, bạn vào link truy cập của mình như một ứng dụng PHP bình thường và sử dụng mật khẩu để truy cập

**Admin Login Details** (Sử dụng đường dẫn home thêm `/admin`)

```shell
Email : admin@mail.com
Password: admin@mail.com
```

**Customer Login Details** (Ấn vào chữ Login trên màn hình home)

```shell
Email : customer@mail.com
Password: customer@mail.com
```

> Bước 4 Đổi lại `php.validate.executablePath` trong file `.vscode/settings.json `cho phù hợp với máy của bạn

> Lưu ý nếu gặp một số lỗi sau thì đây sẽ là cách xử lý dành cho bạn

-   Lỗi `Failed to open stream: Permission denied` do không có quyền truy cập các file trong `storage` hoặc `public`.

```shell
// Chạy lại các lệnh phân quyền và run lại config:
chmod -R gu+w storage
chmod -R guo+w storage
php artisan cache:clear

// Nếu các lệnh trên chưa phân quyền hết thì hãy dùng tiếp các lệnh sau:
php artisan cache:clear
composer dump-autoload
sudo chmod -R 777 storage/*
sudo chmod -R 777 storage/logs/*
sudo chmod -R 775 bootstrap/cache
php artisan config:cache

// Sau khi thực hiện có thể khởi động lại Apache
```

### Account login

### Tạo liên kết tượng trưng để link từ

**Ý nghĩa**: Các gói laravel-filemanager và các gói khác sử dụng liên kết tượng trưng, tức là file thực tế lưu ở `storage\app\public` nhưng khi truy cập `public\storage` bạn vẫn có thể thấy và truy cập chúng.

Tham khảo:

-   Xem câu trả lời `Delete folder storage from public and run this command in cron job (one time)` trong câu hỏi sau: [Laravel storage link won't work on production](https://stackoverflow.com/questions/50730143/laravel-storage-link-wont-work-on-production)

> Trên Mac

```shell
ln -s /Applications/XAMPP/xamppfiles/htdocs/aptech-laravel-ecommerce-demo/storage/app/public /Applications/XAMPP/xamppfiles/htdocs/aptech-laravel-ecommerce-demo/public/storage
```

> Trên Window

```shell
mklink /D "D:\Soft\laragon\www\aptech-laravel-ecommerce-demo\storage\app\public" "D:\Soft\laragon\www\aptech-laravel-ecommerce-demo\public\storage"
```

Sau khi tạo liên kết, bạn cần setting lại APP_URL trong env trở đến URL public của dự án

Tiếp theo hãy thực hiện các lệnh:

```shell
    php artisan vendor:publish --tag=lfm_config
    php artisan vendor:publish --tag=lfm_public
    php artisan route:clear
    php artisan config:clear
```

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
