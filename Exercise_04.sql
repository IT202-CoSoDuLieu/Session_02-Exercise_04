CREATE DATABASE IF NOT EXISTS Exercise_04;
USE Exercise_04;

DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Phone INT
);

INSERT INTO USERS (FullName, Phone) VALUES
('Nguyễn Văn A', 981234567),
('Trần Thị B', 912345678),
('Lê Văn C', 123456789);

ALTER TABLE USERS
MODIFY Phone VARCHAR(15);

SELECT * FROM USERS;

-- Phân tích đề xuất giải pháp
-- Giải pháp 1: Sửa trực tiếp (Sử dụng ALTER TABLE MODIFY. MySQL tạo bảng tạm, chuyển dữ liệu và ghi đè bảng cũ) => phú hợp hệ thống nhỏ hoặc có thời gian bảo trì
-- Giải pháp 2: Dùng cột ẩn/ cột phụ (Thêm cột mới VARCHAR, đồng bộ dữ liệu từ cột cũ sang, sau đó đổi tên cột) => Phù hợp hệ thống lớn , yêu cầu online 24/7

-- So sánh
-- Giải pháp 1 (Direct Alter): Dùng một lệnh sửa trực tiếp; ưu điểm là nhanh, gọn nhưng nhược điểm lớn là gây khóa bảng (Table Lock), dễ làm treo ứng dụng khi có 2 triệu bản ghi
-- Giải pháp 2 (Shadow Column): Tạo cột tạm rồi mới chuyển dữ liệu; ưu điểm là an toàn, không gián đoạn hệ thống (Zero Downtime) nhưng nhược điểm là thao tác phức tạp, tốn tài nguyên.