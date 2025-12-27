
create database [QuanLyWebsite]
go 
use [QuanLyWebsite]
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create table THUONGHIEU (
MaTH varchar (10) primary key, 
TenTH nvarchar (50)
);

create table SANPHAM (
MaSP varchar(10) primary key,
TenSP nvarchar (100) NOT NULL, 
SLTon int NULL, 
GiaBan int NOT NULL, 
XuatXu nvarchar(50) NOT NULL, 
MoTa nvarchar(200) NOT NULL, 
MaTH varchar(10), 
HinhAnh varchar(50),
foreign key (MaTH) references THUONGHIEU(MaTH)
);

create table DANHMUC (
MaDM varchar(10) , 
MaSP varchar(10),
TenDM nvarchar(20),
foreign key (MaSP) references SANPHAM(MaSP),
primary key (MaDM,MaSP)
); 


create table TAIKHOAN (
MaTK varchar(10) primary key,
TenTK varchar(50) NOT NULL, 
MatKhau varchar(50) NOT NULL, 
HoTen nvarchar(50) NOT NULL, 
Email varchar(100) NOT NULL, 
SDT varchar(15),
DiaChi nvarchar(300) NOT NULL,
LoaiTK bit
);

create table NHACUNGCAP (
MaTK varchar(10),
MaSP varchar(10),
foreign key (MaTK) references TAIKHOAN(MaTK),
foreign key (MaSP) references SANPHAM(MaSP),
primary key (MaSP)
);

create table DANHGIASP (
MaTK varchar(10),
MaSP varchar(10),
Diem int,
BinhLuan nvarchar(200),
foreign key (MaTK) references TAIKHOAN(MaTK),
foreign key (MaSP) references SANPHAM(MaSP),
primary key (MaTK,MaSP)
);

create table DONHANG (
MaDH varchar(10) primary key, 
MaTK varchar(10), 
DatHang_Date date NOT NULL, 
GHTC_Date date NULL, 
TinhtrangDH int check (TinhTrangDH BETWEEN 1 AND 4),
foreign key (MaTK) references TAIKHOAN(MaTK)
);

create table CHITIETDH (
MaDH varchar(10),
MaSP varchar(10),
SoLuong int,
GiamGia decimal(4,2),
GiaBan int, 
foreign key (MaDH) references DONHANG(MaDH),
foreign key (MaSP) references SANPHAM(MaSP),
primary key (MaDH,MaSP)
);

 
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('Z00001', 'Zara')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('A00001', 'Adidas')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('N00001', 'Nike')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('C00001', 'Converse')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('N00002', 'New Balance')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('M00001', 'MLB')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('V00001', 'Vans')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('P00001', 'PEDRO')
;
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES ('N00003', 'Nine West')
;

INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0001', N'Nike Air Force 1 White Low', 236, 3256000, N'Hoa Kỳ', N'Thiết kế ấn tượng Tính năng thời trang All in one Công nghệ đế Air độc quyền Size: 36-44', N'IMG-1022', N'N00001')
;
INSERT SANPHAM ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0002', N'Vans Old Skool Classic Black', 208, 1650000, N'Hoa Kỳ', N'Dễ dàng phối với nhiều loại trang phục Trẻ trung năng động và vô cùng cuốn hút Thời Trang Đường Phố. Size: 36-44', N'IMG-574-2', N'V00001')
;
INSERT SANPHAM ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0003', N'Adidas Originals Samba', 136, 5250000, N'Hoa Kỳ', N'Giày Sneaker nam nữ Thiết kế thể thao trung cá tính Thích hợp đi học, đi chơi, đi du lịch,... Size: 36-44', N'IMG-589', N'A00001')
;
INSERT SANPHAM ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0004', N'Converse Run Star Hike Hi Top Black', 235, 1559000	,N'Hoa Kỳ',	N'Giày Sneaker nữ Thiết kế classic chucks trẻ trung Dễ dàng kết hợp với các trang phục, phụ kiện khác Chất liệu: Vải, Canvas & Đế cao su tổng hợp. Size: 36-39. Chiều cao đế: 4.5 cm.', 	N'IMG-2867',	N'C00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0005', N'New Balance 574 Grey Blue', 329, 2200000, N'Hoa Kỳ', N'Giày Sneaker nam nữ Thiết kế thể thao trẻ trung cá tính Thích hợp đi học, đi chơi, đi du lịch,... Size: 36-44', N'IMG-913', N'N00002')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0006', N'MLB Big Ball Chunky A NY Yankees', 112, 3550000, N'Hàn Quốc', N'Giày Sneaker nam nữ Thiết kế chunky trẻ trung Chất liệu: Da PU & đế cao su tổng hợp Size: 36-44 Chiều cao đế: 4cm', N'IMG-634', N'M00001')
; 
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0007', N'Dép Da Lộn Đế Bằng', 105, 1999000, N'Việt Nam', N'Dép sục da lộn, đế bằng. Chần chỉ nổi trang trí. Có quai cài khóa cài để điều chỉnh sau gót. Đế cao: 2cm Size: 36-40', N'IMG-362', N'Z00001')
;       
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0008', N'Dép Biker Da', 123, 2499000, N'Maroc', N'Dép sục da. Có các chi tiết quai kèm khóa cài trang trí. Gót vuông. Size: 36-40 Gót cao: 6 cm', N'IMG-2354', N'Z00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS0009', N'Dép Da Có Quai Cài Khóa Cài', 72, 1499000, N'Trung Quốc', N'Dép sục đế bằng. Có quai bản rộng cài khóa cài sau gót. Size: 36-44 Đế cao: 2 cm.', N'IMG-3552', N'Z00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00010', N'Boots Da Đế Bằng Kéo Khóa', 56, 3299000, N'Campuchia', N'Bốt cổ ngắn chất liệu da. Đế dày. Cài khóa kéo. Mũi tròn. Size: 36-41 Đế cao: 4,5 cm.', N'IMG-356-336', N'Z00001'); 
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00011', N'Giày cao gót bít mũi Mia Leather', 20, 2199000, N'Singapore', N'Kiểu dáng: Giày cao gót bít mũi Màu sắc: Black, Chalk, Wine Chất liệu: Kid Leather Lớp lót: Fabric Chiều cao đế: 9 (cm) Thích hợp dùng trong các dịp: Đi làm, đi chơi, đi tiệc... Size: 36-39', N'IMG-3333', N'P00001');
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00012', N'PEDRO Giày cao gót bít mũi hở gót Romona Leather Mule', 30, 1799000, N'Singapore', N'Thành phần chất liệu: Kid Leather. Lớp lót: PU Độ cao gót: 6.5 cm Kiểu dáng giày cao gót mũi nhọn thời trang Màu sắc tao nhã, phù hợp với nhiều kiểu trang phục Size: 36-39', N'IMG-3334', N'P00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00013', N'Giày mules cao gót quai ngang hở mũi Ruched', 35, 1399000, N'Singapore', N'Chất liệu: Natural Faux Leather. Lớp lót: PU Chiều cao gót: 4cm Kiểu dáng giày cao gót sang trọng, trẻ trung Size: 36-39', N'IMG-3335', N'P00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00014', N'Boots Đế Cao Su Dáng Bằng', 76, 1999000, N'Trung Quốc', N'Bốt hiệu ứng mài sờn. Đế cao su, có răng cưa. Có quai hỗ trợ xỏ hai bên. Mũi tròn. Size: 36-40 Đế cao: 4 cm.', N'IMG-956-3', N'Z00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00015', N'Boots Da Cổ Ngắn Mũi Vuông', 67, 3599000, N'Trung Quốc', N'Bốt cổ ngắn chất liệu da. Ống bốt rộng. Có quai hỗ trợ xỏ phía sau. Mũi vuông. Size: 36-44 Đế cao: 4 cm.', N'IMG-666-66', N'Z00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00016', N'Giày sandals cao gót quai mảnh đính nơ Kensta3', 10, 1590000, N'Mỹ', N'Kiểu dáng: Giày sandals cao gót Màu sắc: White, Yellow, Beige, Black Chất liệu: Da tổng hợp Chiều cao: 7.5 cm Thích hợp dùng trong các dịp: Đi chơi, đi làm,... Size: 36-39', N'IMG-3336', N'N00003')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00017', N'Giày búp bê đế thấp phối nơ điệu đà Jinks3p', 25, 1990000, N'Mỹ', N'Kiểu dáng: Giày búp bê đế thấp Màu sắc: Black Chất liệu: Leather Chất liệu: Da tổng hợp/Da động vật Chiều cao: 2 cm Thích hợp dùng trong các dịp: Đi chơi, đi làm,... Size: 36-39', N'IMG-3337', N'N00003')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00018', N'Giày búp bê đế bệt Mindy Satin', 15, 1799000, N'Singapore', N'Kiểu dáng: Giày búp bê đế bệt Màu sắc: Black, Light Blue Chất liệu: TBC Xu hướng theo mùa: Sử dụng được tất cả các mùa trong năm Size: 36-39', N'IMG-3338', N'P00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00019', N'Vans Old Skool Classic Black', 208, 1650000, N'Hoa Kỳ', N'Dễ dàng phối với nhiều loại trang phục\nTrẻ trung năng động và vô cùng cuốn hút\nThời Trang Đường Phố.\nSize: 36-44', N'IMG-574-2', N'V00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00020', N'Giày mules cao gót quai ngang hở mũi Ruched', 35, 1399000, N'Singapore', N'Chất liệu: Natural Faux Leather. Lớp lót: PU\nChiều cao gót: 4cm\nKiểu dáng giày cao gót sang trọng, trẻ trung\nSize: 36-39', N'IMG-3335',N'P00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00021', N'Giày búp bê đế thấp phối nơ điệu đà Jinks3p', 25, 1990000, N'Mỹ', N'Kiểu dáng: Giày búp bê đế thấp\nMàu sắc: Black\nChất liệu: Leather\nChất liệu: Da tổng hợp/Da động vật\nChiều cao: 2 cm\nThích hợp dùng trong các dịp: Đi chơi, đi làm,...\nSize: 36-39', N'IMG-3337', N'N00003')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00022', N'Boots DA ĐẾ BẰNG KÉO KHÓA', 56, 3299000, N'Campuchia', N'Bốt cổ ngắn chất liệu da. Đế dày. Cài khóa kéo. Mũi tròn.\nSize: 36-41\nĐế cao: 4,5 cm.', N'IMG-356-336', N'Z00001')
;
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [SLTon], [GiaBan], [XuatXu], [MoTa], [HinhAnh], [MaTH]) 
VALUES (N'SS00023', N'MLB Big Ball Chunky A NY Yankees', 112, 3550000, N'Hàn Quốc', N'Giày Sneaker nam nữ\nThiết kế chunky trẻ trung\nChất liệu: Da PU & đế cao su tổng hợp\nSize: 36-44\nChiều cao đế: 4cm', N'IMG-634', N'M00001')
;

INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS0001', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS0002', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS0003', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS0004', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS0005', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS0006', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM02', N'SS0007', N'Dép')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM02', N'SS0008', N'Dép')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM02', N'SS0009', N'Dép')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM03', N'SS00010', N'Boots')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM03', N'SS00014', N'Boots')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM03', N'SS00015', N'Boots')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS0001', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS0002', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS0003', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS0005', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS0007', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS0009', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS00017', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS00018', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS0004', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS0006', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS0008', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00010', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00014', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00015', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00011', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00013', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00016', N'Giày Đế Cao')

INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00012', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS00019', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS00019', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00020', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM04', N'SS00021', N'Giày Đế Bằng')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM03', N'SS00022', N'Boots')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00022', N'Giày Đế Cao')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM01', N'SS00023', N'Giày Sneaker')
;
INSERT [dbo].[DANHMUC] ([MaDM], [MaSP], [TenDM]) VALUES (N'DM05', N'SS00023', N'Giày Đế Cao')
;

INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK001', N'nganguyet23', N'1233******', N'Nguyễn Nguyệt Nga', N'nguyetnga123@gmail.com', N'0771234568', N'12 Hai Bà Trưng, phường Tân Định, Quận 1, TPHCM', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK002', N'caco15', N'danca*******', N'Trần Vọng Cổ', N'thichhatcailuong@gmai.com', N'0934663314', N'65/1 TTN02, phường Tân Thới Nhất, Quận 12, TPHCM', 0)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK003', N'baitienlen52la', N'bandon********', N'Đỗ Bài Bản', N'dobaiban01@gmail.com', N'0121227161', N'22/15 Đỗ Thúc Tịnh, phường 12, Quận Gò Vấp, TPHCM', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK004', N'chidau1945', N'gaga*******', N'Lê Thị Đào', N'chidau08@gmail.com', N'0937125623', N'64a Hoàng Bật Đạt, phường 15, Quận Tân Bình, TPHCM', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK005', N'hoisayxe70', N'maco*****', N'Liễu Hà Huệ', N'hhh009@gmail.com', N'0936604012', N'640 Quang Trung, phường 11, Quận Gò Vấp, TPHCM', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK006', N'ngocanhbui2', N'haha*********', N'Thái Ngọc Anh', 'anhiuoi@gmail.com', N'0761563116', N'68/4a Trần Quang Khải, phường Tân Định, Quận 1, TPHCM', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK007', N'nganvo43', N'8qq12*****', N'Võ Ngọc Ngân', N'ngannee11@gmail.com', N'0931629134', N'Hẻm 191 Hà Tôn Quyền, Phường 4, Quận 11, TPHCM', 0)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK008', N'lanngoc76', N'hoa99*******', N'Hà Trần Ngọc Lan', N'bolerohaylam@gmail.com', N'0921286346', N'16 đường số 37 Nguyễn Văn Linh, Trường Tây, Hòa Thành, Tây Ninh', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK009', N'casimytam12', N'hathay********', N'Trần Mỹ Tâm', N'top1server@gmail.com', N'0907705566', N'232 Nguyễn Thị Thập, phường Bình Thuận, quận 7, TPHCM', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK010', N'casibichphuong43', N'tung12******', N'Bùi Bích Phương', N'phuongca03@gmail.com', N'0783346511', N'24 Ký Con, phường Nguyễn Thái Bình, quận 1, TPHCM', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK011', N'chiemthuyvan22', N'9210p********', N'Vương Thúy Kiều', N'kieulacloi11@gmail.com', N'0792934355', N'E29 Phan Đình Phùng, Phường Quang Vinh, Tp Biên Hòa, Đồng Nai', 0)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK012', N'bichhuu98', N'cunyeu******', N'Lương Bích Hữu', N'nghihuu.abc@gmail.com', N'0808804480', N'Số 10 Lạc Hồng, Thành phố Rạch Giá, Tỉnh Kiên Giang.', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK013', N'jack97', N'meome*****', N'Trịnh Trần Phương Tuấn', N'tuan5M@gmail.com', N'0123405599', N'547/44 Đường Mỹ Phước Tân Vạn, PhườngTân Đông Hiệp, Thành phố Dĩ An, Bình Dương', 1)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK014', N'anhloan11', N'buonng*****', N'Lưu Ánh Loan', N'loanyeukieu333@gmail.com', N'0909805612', N'172 Hoà Hưng, Phường 13, Quận 10, TPHCM', 0)
;
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenTK], [MatKhau], [HoTen], [Email], [SDT], [DiaChi], [LoaiTK]) VALUES (N'0301TK015', N'mrdam28', N'129hh*********', N'Đàm Vĩnh Hưng', N'vinhham.hung@gmail.com', N'0301382256', N'42 Đặng Thái Thân, Phường 3, Thành phố Đà Lạt, Tỉnh Lâm Đồng', 0)
;

INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK002', N'SS0001');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK002', N'SS0002');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK002', N'SS0003');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK002', N'SS0004');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK002', N'SS0005');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK007', N'SS0006');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK007', N'SS0007');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK007', N'SS0008');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK007', N'SS0009');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK011', N'SS00010');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK011', N'SS00011');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK011', N'SS00012');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK014', N'SS00013');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK014', N'SS00014');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK014', N'SS00015');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK014', N'SS00016');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK014', N'SS00017');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK015', N'SS00018');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK015', N'SS00019');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK015', N'SS00020');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK015', N'SS00021');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK015', N'SS00022');
INSERT [dbo].[NHACUNGCAP] ([MaTK], [MaSP]) VALUES (N'0301TK015', N'SS00023');

INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00001', N'0301TK008', CAST(N'2023-01-01' AS DATE), CAST('2023-01-05' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00002', N'0301TK009', CAST(N'2023-01-15' AS DATE), CAST('2023-01-17' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00003', N'0301TK010', CAST(N'2023-01-25' AS DATE), CAST('2023-01-28' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00004', N'0301TK012', CAST(N'2023-01-30' AS DATE), NULL, 4);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00005', N'0301TK013', CAST(N'2023-02-02' AS DATE), NULL, 4);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00006', N'0301TK001', CAST(N'2023-02-14' AS DATE), CAST('2023-02-15' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00007', N'0301TK003', CAST(N'2023-02-14' AS DATE), CAST(N'2023-02-18' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00008', N'0301TK004', CAST(N'2023-04-30' AS DATE), NULL, 2);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00009', N'0301TK005', CAST(N'2023-03-08' AS DATE), CAST(N'2023-03-25' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00010', N'0301TK006', CAST(N'2023-03-26' AS DATE), CAST(N'2023-03-26'AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00011', N'0301TK008', CAST(N'2024-04-11' AS DATE), NULL, 1);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00012', N'0301TK004', CAST(N'2023-04-04' AS DATE), CAST(N'2023-04-07' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00013', N'0301TK005', CAST(N'2023-04-30' AS DATE), CAST(N'2023-05-06' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00014', N'0301TK006', CAST(N'2023-05-01' AS DATE), CAST(N'2023-05-03' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00015', N'0301TK003', CAST(N'2023-05-15' AS DATE), CAST(N'2023-05-17' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00016', N'0301TK004', CAST(N'2024-04-12' AS DATE), NULL, 1);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00017', N'0301TK005', CAST(N'2023-06-01' AS DATE), CAST(N'2023-06-03' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00018', N'0301TK006', CAST(N'2023-06-06' AS DATE), CAST(N'2023-06-12' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00019', N'0301TK008', CAST(N'2023-06-20' AS DATE), CAST(N'2023-06-30' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00020', N'0301TK009', CAST(N'2023-07-07' AS DATE), NULL, 4);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00021', N'0301TK009', CAST(N'2023-07-13' AS DATE), CAST(N'2023-08-05' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00022', N'0301TK010', CAST(N'2023-07-21' AS DATE), CAST(N'2023-07-30' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00023', N'0301TK012', CAST(N'2023-08-07' AS DATE), NULL, 4);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00024', N'0301TK013', CAST(N'2023-08-08' AS DATE), CAST(N'2023-08-15' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00025', N'0301TK008', CAST(N'2023-08-23' AS DATE), CAST (N'2023-08-30' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00026', N'0301TK009', CAST(N'2023-09-09' AS DATE), CAST(N'2023-09-14' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00027', N'0301TK010', CAST(N'2024-03-31' AS DATE), NULL, 2);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00028', N'0301TK012', CAST(N'2023-09-21' AS DATE), CAST(N'2023-09-28' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00029', N'0301TK001', CAST(N'2023-10-20' AS DATE), CAST(N'2023-10-20' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00030', N'0301TK003', CAST(N'2023-10-20' AS DATE), CAST(N'2023-02-11' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00031', N'0301TK004', CAST(N'2024-04-09' AS DATE), NULL, 1);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00032', N'0301TK005', CAST(N'2023-11-01' AS DATE), CAST(N'2023-11-05' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00033', N'0301TK006', CAST(N'2023-11-11' AS DATE), CAST(N'2023-11-13' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00034', N'0301TK006', CAST(N'2023-11-11' AS DATE), CAST(N'2023-11-15' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00035', N'0301TK008', CAST(N'2023-12-20' AS DATE), NULL, 4);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00036', N'0301TK009', CAST(N'2023-12-21' AS DATE), CAST('2023-12-23' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00037', N'0301TK010', CAST('2023-12-22' AS DATE), CAST(N'2023-12-23' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00038', N'0301TK003', CAST(N'2024-01-01' AS DATE), CAST(N'2024-01-05' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00039', N'0301TK004', CAST(N'2024-01-01' AS DATE), CAST(N'2024-01-07' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00040', N'0301TK005', CAST(N'2024-01-02' AS DATE), NULL, 2);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00041', N'0301TK006', CAST(N'2024-01-08' AS DATE), NULL, 2);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00042', N'0301TK008', CAST(N'2024-01-09' AS DATE), CAST(N'2024-01-10' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00043', N'0301TK009', CAST(N'2024-01-15' AS DATE), CAST(N'2024-01-16' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00044', N'0301TK010', CAST(N'2024-01-15' AS DATE), CAST(N'2024-01-16' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00045', N'0301TK012', CAST(N'2024-01-20' AS DATE), NULL, 4);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00046', N'0301TK001', CAST(N'2024-01-25' AS DATE), NULL, 2);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00047', N'0301TK003', CAST(N'2024-01-28' AS DATE), CAST(N'2024-01-29' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00048', N'0301TK004',CAST(N'2024-02-01' AS DATE), CAST(N'2024-02-02' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00049', N'0301TK009',CAST(N'2024-02-01' AS DATE), CAST(N'2024-02-05' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00050', N'0301TK010', CAST(N'2024-02-12' AS DATE), NULL, 1);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00051', N'0301TK012', CAST(N'2024-02-10' AS DATE), CAST(N'2024-02-12' AS DATE), 3);
INSERT [dbo].[DONHANG] ([MaDH], [MaTK], [DatHang_Date], [GHTC_Date], [TinhTrangDH])
VALUES (N'DH00052', N'0301TK013', CAST(N'2024-02-18' AS DATE), CAST(N'2024-02-18' AS DATE), 3);

INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK001', N'SS00018', 4, N'Tạm ổn, sẽ suy nghĩ mua lần sau nếu cần');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK003', N'SS00016', 5, N'Quá tốt, sẽ quay lại');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK003', N'SS00010', 3, N'Bình thường');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK004', N'SS0001', 3, N'Thấy cũng được');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK004', N'SS0003', 2, N'Giao nhầm size, mà không đổi trả theo yêu cầu');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK004', N'SS00016', 5, N'Quá là tuyệt');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK005', N'SS00015', 4, N'Thấy ổn thôi');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK005', N'SS00010', 5, N'Sẽ mua tiếp');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK005', N'SS0009', 4, N'Cũng vừa túi tiền');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK006', N'SS0006', 3, N'Ổn trong tầm giá');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK006', N'SS0009', 3, N'Thấy cũng tạm');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK006', N'SS00014', 2, N'Mắc mà chất lượng quá bth');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK008', N'SS0002', 1, N'Sp quá tệ, không nên mua');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK008', N'SS00011', 1, N'Sốp không tôn trọng KH');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK008', N'SS0001', 4, N'Màu sản phẩm không giống như trên hình, tuy nhiên vẫn khá ổn');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK009', N'SS00014', 5, N'Boots mang lên khá đẹp, tôn dáng');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK009', N'SS00010', 4, N'Cũng đượccc');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK010', N'SS0004', 3, N'Sản phẩm sử dụng không bền, dễ phai màu');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK010', N'SS0008', 5, N'Sản phẩm rất tốt, sẽ mua thêm');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK012', N'SS00018', 2, N'Giao nhầm hàng, gửi phản hồi mà shop không xử lý');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK013', N'SS0006', 4, N'Hàng chất lượng khá, giao hàng hơi lâu');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK009', N'SS00022', 5, N'Nice!!!');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK006', N'SS00023', 4, N'Form giày hơi thô không giống như mong đợi lắm');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK010', N'SS00021', 5, N'Giày đẹp, sẽ giới thiệu cho bạn bè mua');
INSERT [dbo].[DANHGIASP] ([MaTK], [MaSP], [Diem], [Binhluan]) VALUES (N'0301TK009', N'SS00019', 2, N'Dây cài của dép bị hư, liên hệ shop mà không xử lý');

INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00004', N'SS0001', 2, 0.05, 3256000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00033', N'SS0001', 2, 0.1, 3256000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00042', N'SS0001', 1, 0.15, 3256000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00051', N'SS0001', 1, 0, 3256000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00006', N'SS00010', 1, 0.1, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00015', N'SS00010', 2, 0.1, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00017', N'SS00010', 3, 0.2, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00020', N'SS00022', 7, 0.25, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00024', N'SS00022', 1, 0.2, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00030', N'SS00010', 3, 0.23, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00036', N'SS00022', 3, 0.15, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00045', N'SS00010', 1, 0, 3299000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00003', N'SS00011', 1, 0.1, 2199000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00014', N'SS00011', 4, 0.2, 2199000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00017', N'SS00011', 1, 0.1, 2199000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00021', N'SS00011', 2, 0.1, 2199000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00025', N'SS00011', 5, 0.1, 2199000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00007', N'SS00012', 2, 0.05, 1799000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00008', N'SS00013', 1, 0, 1399000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00001', N'SS00014', 1, 0.12, 1999000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00018', N'SS00014', 5, 0.05, 1999000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00022', N'SS00014', 3, 0.15, 1999000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00026', N'SS00014', 6, 0.33, 1999000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00009', N'SS00015', 2, 0.05, 3599000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00013', N'SS00015', 2, 0.12, 3599000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00019', N'SS00015', 6, 0.15, 3599000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00022', N'SS00015', 1, 0.4, 3599000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00027', N'SS00015', 2, 0.3, 3599000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00010', N'SS00016', 3, 0.05, 1590000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00031', N'SS00016', 1, 0, 1590000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00038', N'SS00016', 3, 0.05, 1590000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00047', N'SS00016', 2, 0.2, 1590000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00011', N'SS00017', 1, 0.05, 1990000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00030', N'SS00017', 2, 0.2, 1990000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00037', N'SS00021', 2, 0.12, 1990000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00046', N'SS00021', 6, 0.15, 1990000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00012', N'SS00018', 1, 0.1, 1799000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00028', N'SS00018', 1, 0, 1799000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00029', N'SS00018', 8, 0.28, 1799000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00001', N'SS0002', 1, 0.12, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00012', N'SS0002', 1, 0.1, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00016', N'SS0002', 3, 0.16, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00020', N'SS0002', 2, 0.1, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00023', N'SS00019', 2, 0.4, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00032', N'SS00019', 2, 0.2, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00040', N'SS00019', 2, 0.05, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00049', N'SS00019', 3, 0.15, 1650000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00002', N'SS0003', 1, 0.05, 5250000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00013', N'SS0003', 1, 0.12, 5250000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00031', N'SS0003', 2, 0.15, 5250000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00039', N'SS0003', 1, 0.1, 5250000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00048', N'SS0003', 1, 0.1, 5250000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00001', N'SS0004', 2, 0.12, 1559000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00033', N'SS0004', 3, 0.1, 1559000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00041', N'SS0004', 4, 0, 1559000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00050', N'SS0004', 4, 0.2, 1559000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00005', N'SS0006', 1, 0.05, 3550000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00016', N'SS0006', 2, 0.2, 3550000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00020', N'SS0006', 1, 0, 3550000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00023', N'SS00023', 3, 0.15, 3550000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00034', N'SS00023', 1, 0.25, 3550000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00043', N'SS0006', 3, 0.2, 3550000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00052', N'SS0006', 2, 0.1, 3550000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00006', N'SS0008', 1, 0.1, 2499000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00035', N'SS0008', 2, 0.1, 2499000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00044', N'SS00020', 2, 0.12, 1399000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00003', N'SS0009', 1, 0.1, 1499000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00013', N'SS0009', 2, 0.12, 1499000);
INSERT [dbo].[CHITIETDH] ([MaDH], [MaSP], [SoLuong], [GiamGia], [GiaBan]) VALUES (N'DH00030', N'SS00020', 7, 0.25, 1399000);

