use DangKyHocPhan

create Table TaiKhoan(
Id int not null primary key,
UserName nvarchar(255) not null,
UserPassWord nvarchar(255) not null,
[Role] int ,
Ten nvarchar(255) not null,
NgaySinh date,
GioiTinh int,
DiaChi nvarchar(255),
Email nvarchar(255),
SoDienThoai varchar(15)
);

create table SinhVien(
Id int not null primary key,
TaiKhoanId int not null FOREIGN KEY REFERENCES TaiKhoan(Id),
MSSV nvarchar(10) not null,
Khoa nvarchar(255),
NamHoc nvarchar(255),
He nvarchar(255)
);

create table GiangVien(
Id int not null primary key,
MaGiangVien nvarchar(10) not null,
TaiKhoanId int not null foreign key references TaiKhoan(Id),
ChuyenNganh nvarchar(255))


create table CanBoDaoTao(
Id int not null primary key,
TaiKhoanId int not null foreign key references TaiKhoan(Id),
MaCBDT int not null,
ChucVu nvarchar(255))


create table MonHoc(
Id int not null primary key,
MaMonHoc int not null,
TenMonHoc nvarchar(255) not null,
SoTinChi int not null,
SoTinChiLyThuyet int  not null,
SoTinChiThucHanh int not null)

create table MonHocHP(
Id int primary key,
MaMonHocPhan nvarchar(255),
MonHocId int not null foreign key references MonHoc(Id),
TrangThai int
)

create table PhongHoc(
Id int not null primary key,
TenPH nvarchar(255) not null,
SoLuongChua int )

create table LopHocPhan(
Id int not null primary key,
MaLopHocPhan nvarchar(255),
MaMonHoc int foreign key references MonHocHP(Id),
GiangVienId int foreign key references GiangVien(Id),
SiSoDaDangKy int not null,
SiSoToiDa int not null,
TrangThai int,
HocKy int,
NamHoc int,
PhongHocId int foreign key references PhongHoc(Id)
)


create table SinhVien_MonHocHP(
SinhVienId int not null foreign key references SinhVien(Id),
LopHocPhanId int  not null foreign key references LopHocPhan(Id),
TrangThai int not null
)

create table CanBoDaoTao_LopHocPhan(
Id int not null primary key,
CanBoId int foreign key references CanBoDaoTao(Id),
LopHocPhanId int foreign key references LopHocPhan(Id)
)

create table SinhVien_LopHocPhan(
Id int not null primary key,
SinhVienId int not null foreign key references SinhVien(Id),
LopHocPhanId int not null foreign key references LopHocPhan(Id),
TrangThai int not null
)


--create table ChuongTrinhKhung(
--Id int not null primary key,
--MaChuongTrinhKhung  nvarchar(255) ,
--HocKy int not null,
--MonHocId int not null foreign key references MonHoc(Id),
--HocPhan int
--)

--create table SinhVien_ChuongTrinhKhung(
--Id int not null primary key,
--SinhVienId int not null foreign key references SinhVien(Id),
--MaChuongTrinhKhung nvarchar (255) not null foreign  references ChuongTrinhKhung(MaChuongTrinhKhung)
--)