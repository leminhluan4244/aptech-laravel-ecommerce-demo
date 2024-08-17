## `Auth::routes(['register'=>false]);`

### **1. `Auth::routes()` là gì?**

-   Đây là một helper function trong Laravel được sử dụng để tạo nhanh các route liên quan đến quá trình xác thực người dùng (authentication).
-   Khi gọi hàm này, Laravel sẽ tự động tạo ra các route cho các chức năng phổ biến như: đăng nhập, đăng ký, đăng xuất, xác thực email, quên mật khẩu, v.v.
-   Nếu bạn thêm dòng code `Auth::routes()` vào file `routes/web.php` của Laravel, thì ứng dụng của bạn sẽ có các route sau:

| Route                   | Tính năng                                | Method | Route Name          | Controller@function                               | Model    | View                 |
| ----------------------- | ---------------------------------------- | ------ | ------------------- | ------------------------------------------------- | -------- | -------------------- |
| /login                  | Hiển thị form đăng nhập                  | GET    | login               | Auth\LoginController@showLoginForm                | App\User | auth.login           |
| /logout                 | Đăng xuất khỏi hệ thống                  | POST   | logout              | Auth\LoginController@logout                       | App\User |                      |
| /register               | Hiển thị form đăng ký                    | GET    | register            | Auth\RegisterController@showRegistrationForm      | App\User | auth.register        |
| /password/reset         | Hiển thị form yêu cầu đặt lại mật khẩu   | GET    | password.request    | Auth\ForgotPasswordController@showLinkRequestForm | App\User | auth.passwords.email |
| /password/email         | Gửi email đặt lại mật khẩu               | POST   | password.email      | Auth\ForgotPasswordController@sendResetLinkEmail  | App\User |                      |
| /password/reset/{token} | Hiển thị form đặt lại mật khẩu với token | POST   | password.update     | Auth\ResetPasswordController@reset                | App\User | auth.passwords.reset |
| /email/verify           | Hiển thị thông báo xác thực email        | GET    | verification.notice | Auth\VerificationController@show                  | App\User | auth.verify          |
| /email/verify/resend    | Gửi lại email xác thực                   | POST   | verification.resend | Auth\VerificationController@resend                | App\User |                      |

### **2. `['register'=>false]` có ý nghĩa gì?**

Nếu bạn đọc thử khai báo của hàm `Auth::routes()` bạn sẽ thấy nó có thể nhận vào một mảng tên `$options`. Đây chính là mảng cho phép bạn truyền vào các options cấu hình mong muốn

![Auth](image.png)

Với hàm `Auth::routes()` nó tự động cấu hình nhiều `route` sẵn có, nếu bạn không muốn dùng route nào trong danh sách này bạn có thể loại trừ chúng bằng cách truyền vào một mảng options

```php
$options = [
    'route không sử dụng 1' => false,
    'route không sử dụng 2' => false,
    //...
];
Auth::routes($options);
```

Ở đây chúng ta loại bỏ chỉ route register không sử dụng nên đã truyền thẳng vào hàm Auth::routes.
