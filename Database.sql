use master
go
drop database Nhom4
go
create database Nhom4
go
use Nhom4
go


create table DanhMucSP(
MaDM varchar(20) not null primary key,
TenDanhMuc nvarchar(50) not null,
)

create table KhuyenMai(
MaKhuyenMai varchar(20) primary key,
TieuDe nvarchar(50),
NgayBatDau datetime,
NgayKetThuc datetime,
Giam float,
MoTa nvarchar(100),
)
create table SanPham(
MaSP varchar(10) not null primary key,
TenSP nvarchar(200) not null,
MaDM varchar(20) not null foreign key references DanhMucSP(MaDM) on delete cascade on update cascade,
MaKhuyenMai varchar(20) foreign key references KhuyenMai(MaKhuyenMai) on delete cascade on update cascade,
New bit,
MoTa nvarchar(500),
)

create table SizeGiay(
KichCo varchar(10) not null primary key,
Loai nvarchar(20),
)

create table AnhMoTa(
MaAnh varchar(10) not null primary key,
HinhAnh nvarchar(300),
MaSP varchar(10) foreign key references SanPham(MaSP) on delete cascade on update cascade,
)

create table ChiTietAnh(
IDAnh int not null primary key,
MaAnh varchar(10) foreign key references AnhMoTa(MaAnh) on delete cascade on update cascade,
AnhChiTiet nvarchar(300),
)

--drop table ChiTietAnh
---------------------------------
create table ChiTietSanPham(
MaAnh varchar(10) foreign key(MaAnh) references AnhMoTa(MaAnh) on delete cascade on update cascade,
KichCo varchar(10) foreign key references SizeGiay(KichCo) on delete cascade on update cascade,
primary key(KichCo,MaAnh),
GiaBan money not null,
)

--drop table PickSP

create table TaiKhoanNguoiDung(
MaTK int identity(1,1) not null primary key,
TenDangNhap nvarchar(100) not null,
MatKhau nvarchar(20) not null,
HoTen nvarchar(200) not null,
SDT char(20) not null,
DiaChi nvarchar(500) not null,
Email varchar(50),
TrangThai bit not null,
)

 create table TaiKhoanQuanTri(
 MaTK int identity(1,1) not null primary key,
 TenDangNhap varchar(50) not null,
 MatKhau varchar(50) not null,
 HoTenUser nvarchar(50) not null,
 LoaiTK nvarchar(10) not null,
 TrangThai bit not null,
 )

create table HoaDon(
MaHD int identity(1,1) not null primary key,
MaTK int foreign key references TaiKhoanNguoiDung(MaTK) on delete cascade on update cascade,
HoTenNguoiNhan nvarchar(50),
SDTNguoiNhan varchar(20),
DiaChiNhan nvarchar(50),
EmailNguoiNhan varchar(50),
NgayLap datetime,
TongTien money,
TrangThai nvarchar(50),
GhiChu nvarchar(50),
)
--drop table HoaDon
create table ChiTietHoaDon(
MaHD int foreign key references HoaDon(MaHD) on delete cascade on update cascade,
MaAnh varchar(10),
KichCo varchar(10),
foreign key (KichCo,MaAnh) references ChiTietSanPham(KichCo,MaAnh) on delete cascade on update cascade,
primary key (MaHD,KichCo,MaAnh),
SoluongMua int not null,
)

Create table TinTuc(
MaTin int identity(1,1) primary key,
TenTin nvarchar(100),
NgayDang datetime,
MaTK int foreign key references TaiKhoanQuanTri(MaTK) on delete cascade on update cascade,
NoiDung nvarchar(1000),
)

create table LienHe(
MaLienHe int identity(1,1) primary key,
SDTLienHe varchar(20),
DiaChi nvarchar(300),
Email varchar(50),
)
------
--drop table ChiTietHoaDon

insert into DanhMucSP(MaDM, TenDanhMuc) values
('DM01', N'Giày Nike'),
('DM02', N'Giày Adias'),
('DM03', N'Giày Vans'),
('DM04', N'Giày Converse'),
('DM05', N'Giày Puma'),
('DM06', N'Giày Balenciaga')

insert into KhuyenMai(MaKhuyenMai,Giam,NgayBatDau,NgayKetThuc,MoTa) values
('KM001', 0.2, '11/11/2021', '12/31/2021',N'Giảm 20% trên 1 sản phẩm'),
('NOEL', 0.1, '11/11/2021', '12/31/2021',N'Giảm 10% trên 1 sản phẩm'),
('KM002', 0.15, '11/11/2021', '12/31/2021',N'Giảm 15% trên 1 sản phẩm')

insert into SanPham(MaSP, TenSP, MaDM, MaKhuyenMai, MoTa, New) values
('SP001', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP002', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP003', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP004', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP005', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP006', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP007', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP008', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP009', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP010', 'Nike air 1','DM01','NOEL','This is a description','0'),
('SP011', 'Nike air 1','DM01','NOEL','This is a description','1'),
('SP012', 'Nike air 1','DM01','NOEL','This is a description','1'),
('SP013', 'Nike air 1','DM01','NOEL','This is a description','1'),
('SP014', 'Nike air 1','DM01','NOEL','This is a description','1'),
('SP015', 'Nike air 1','DM01','NOEL','This is a description','1'),
('SP016', 'Nike air 1','DM01','NOEL','This is a description','1'),
('SP017', 'Nike air 1','DM01','NOEL','This is a description','1'),
('SP018', 'Nike air 1','DM01','NOEL','This is a description','1')

insert into SizeGiay(KichCo, Loai) values
(35,N'Nữ'),
(36,N'Nữ'),
(37,N'Nữ'),
(38,N'Nữ'),
(39,N'Nữ'),
(40,N'Nữ'),
(41,N'Nam'),
(42,N'Nam'),
(43,N'Nam'),
(44,N'Nam')

insert into TaiKhoanNguoiDung(DiaChi, Email, HoTen, SDT, TenDangNhap,MatKhau, TrangThai) values
('Ha Noi', 'NguyenA@gmail.com', N'Nguyen Van A', '098765543','NguyenA','456', '1'),
('Ha Noi', 'NguyenB@gmail.com', N'Nguyen Van B', '098765543','NguyenB','456', '1')


insert into TaiKhoanQuanTri(HoTenUser,TenDangNhap,MatKhau,LoaiTK,TrangThai) values
(N'Quách Phương Thảo', 'QuachThao','123','QuanLy','1'),
(N'Lê Thị Thanh Mỹ', 'ThanhMy','123','QuanLy','1'),
(N'Phạm Thị Thanh', 'PhamThanh','123','QuanLy','1'),
(N'Vũ Ngọc Tâm', 'NgocTam','123','QuanLy','1')

--insert into LienHe(MaLienHe, )

insert into TinTuc (TenTin,MaTK,NgayDang,NoiDung) values
(N'7 cách bảo quản giày thể thao tốt nhất',1,'2/3/2020','This is a content'),
(N'9 kỹ thuật làm đẹp cho u30',1,'2/3/2020','This is a content')

insert into LienHe(SDTLienHe,DiaChi,Email) values
('09876543',N'57 Hoa Quan, Cầu giấy, HN','contactXshop@gmail.com')

--insert into AnhMoTa(MaAnh,MaSP,HinhAnh) values
--(N'A001',N'SP001',N'/BTL/ShoesShopOnline/images/4.jpg')

--insert into ChiTietAnh(IDAnh,MaAnh,AnhChiTiet) values
--(1,N'A001',N'/BTL/ShoesShopOnline/images/4.jpg')

--insert into ChiTietSanPham(MaAnh,KichCo,GiaBan) values
--(N'A001',36,250000)
select *from AnhMoTa