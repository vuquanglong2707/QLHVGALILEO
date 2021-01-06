create database QLSV123
go
use QLSV123
go

/*Tao Cac Table*/

create table Hosotamtru 
(
	ID INT IDENTITY(1,1) primary key,
	MSVien INT,
	Noitamtru Nvarchar(300),
	Ngayden date,
	Ghichu Nvarchar(300),
	CONSTRAINT fk_str FOREIGN KEY (MSVien) 
    REFERENCES SinhVien(MSV)
)

create table DiemTBTL
(
	IDDiem INT IDENTITY(1,1) primary key,
	MaSinhVien int NOT NULL,
	NamHoc NVARCHAR(20),
	DiemTBCHe10 float,
	TBCHe4 float,
	SoTCTL int,
	SoTCTLTK int,
	CONSTRAINT fk_str23333639 FOREIGN KEY (MaSinhVien) 
    REFERENCES SinhVien(MSV)
)

create table DiemRL
(
	Masodiem INT IDENTITY(1,1) primary key,
	MSVien INT,
	Namhoc Nvarchar(50),
	Hocky Nvarchar(20),
	Tongdiem int,
	Xeploai nvarchar(50),
	CONSTRAINT fk_sss99 FOREIGN KEY (MSVien) 
    REFERENCES SinhVien(MSV)
)


create table SinhVien 
(
	MSV INT IDENTITY(1,1) primary key,
	Hoten nvarchar(100),
	Ngaysinh date,
	Gioitinh nvarchar(20),
	Dantoc nvarchar(30),
	SDT nvarchar(30),
	CMND nvarchar(30),
	Email nvarchar(50),
	Hedaotao nvarchar(30),
	Hotenbo nvarchar(50),
	Nghebo nvarchar(50),
	hotenme nvarchar(50),
	Ngheme nvarchar(50),
	Maxa int,
	Makhoa int,
	Malop int,
	Tinhtrang Nvarchar(20),
	CONSTRAINT fk_sss FOREIGN KEY (Malop) 
    REFERENCES Lop(Malop),
	CONSTRAINT fk_sss4 FOREIGN KEY (Maxa) 
    REFERENCES Xa(Maxa)
)


create table Huyen
(
	Mahuyen INT IDENTITY(1,1) primary key,
	Tenhuyen Nvarchar(30),
	Matinh int,
	CONSTRAINT fk_ss1 FOREIGN KEY (Matinh) 
    REFERENCES Tinh(Matinh)
)


create table Xa
(
	Maxa INT IDENTITY(1,1) primary key,
	Tenxa Nvarchar(50),
	Mahuyen int,
	CONSTRAINT fk_ss2 FOREIGN KEY (Mahuyen) 
    REFERENCES Huyen(Mahuyen)
)

create table Tinh
(
	Matinh INT IDENTITY(1,1) primary key,
	Tentinh Nvarchar(30)
)

create table Khoa
(
	Makhoa INT IDENTITY(1,1) primary key,
	Tenkhoa Nvarchar(50),
	SoTien1TC int
)

create table Lop
(
	Malop INT IDENTITY(1,1) primary key,
	Tenlop Nvarchar(30),
	Makhoa int,
	CONSTRAINT fk_lk FOREIGN KEY (Makhoa) 
    REFERENCES Khoa(Makhoa),
)

ALTER TABLE Lop
 ADD Khoa NVARCHAR(10),
	CONSTRAINT kh_lh FOREIGN KEY (Khoa) 
    REFERENCES KhoaHoc(MaKhoaHoc)


create table KhoaHoc
(
	MaKhoaHoc NVARCHAR(10) primary key,
	TenKhoaHoc NVARCHAR(15) NOT NULL,
)


create table Canbo
(
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Hoten NVARCHAR(50),
    Username NVARCHAR(40) NOT NULL,
	Password NVARCHAR(100) NOT NULL,
	QuyenHan NVARCHAR(20) NOT NULL
)


create table GiangVien
(
	MGV NVARCHAR(10) PRIMARY KEY NOT NULL,
	AnhHoSo image,
	Hoten NVARCHAR(30) NOT NULL,
	GioiTinh NVARCHAR(8),
	NgaySinh date,
	SDT NVARCHAR(15),
	CMND NVARCHAR(15) NOT NULL,
	Email NVARCHAR(20),
	ChuyenMon NVARCHAR(20),
	Khoa int Not NULL,
	CONSTRAINT fk_str123 FOREIGN KEY (Khoa) 
    REFERENCES Khoa(MaKhoa)
)

create table MonHoc 
(
	MaMonHoc NVARCHAR(10) PRIMARY KEY,
	TenMonHoc NVARCHAR(80) NOT NULL,
	SoTC int,
	HocKy int,
	MaCN NVARCHAR(15) NULL,
	CONSTRAINT fk_str23xs FOREIGN KEY (MaCN) 
    REFERENCES ChuyenNganh(MaChuyenNganh)
)



create table DiemMonHoc
(
	MaSoDiem INT IDENTITY(1,1) primary key,
	MaSV int NOT NULL,
	MaMH NVARCHAR(10) NOT NULL,
	LanHoc int,
	NamHoc NVARCHAR(20),
	Diem1 float,
	Diem2 float,
	DiemThi float,
	DiemTongKet float,
	DiemChu NVARCHAR(2),
	DiemHe4 float,
	DanhGia NVARCHAR(15),
	CONSTRAINT fk_str233333 FOREIGN KEY (MaSV) 
    REFERENCES SinhVien(MSV),
	CONSTRAINT fk_str233336 FOREIGN KEY (MaMH) 
    REFERENCES MonHoc(MaMonHoc)
)





/*Proc Sqlstore*/
create proc CHECK_LOG(@username NVARCHAR(50),@password NVARCHAR(100)) AS
begin
	SELECT COUNT(*) FROM [QLSV].[dbo].[Canbo] where Username=@username And Password=@password
end


create proc CHANGE_PASS(@username NVARCHAR(50),@password NVARCHAR(100)) AS
begin
	update Canbo set Password=@password where Username=@username
end

select * from Canbo

create proc DIEMTHISV_HOCKY(@msv nvarchar(15),@namhoc NVARCHAR(15),@makhoamonhoc NVARCHAR(5)) AS
begin
	select DiemMonHoc.DiemThi
	from DiemMonHoc inner join MonHoc on DiemMonHoc.MaMH=MonHoc.MaMonHoc
				inner join ChuyenNganh on MonHoc.MaCN=ChuyenNganh.MaChuyenNganh
	where DiemMonHoc.MaSV =@msv and DiemMonHoc.NamHoc=@namhoc and MonHoc.MaCN is not null and ChuyenNganh.Khoa=@makhoamonhoc
end






create proc DIEMCHUSV_HOCKY(@msv nvarchar(15),@namhoc NVARCHAR(15)) AS
begin
	select DiemMonHoc.DiemChu
	from DiemMonHoc
	where DiemMonHoc.MaSV =@msv and DiemMonHoc.NamHoc=@namhoc and DiemMonHoc.LanHoc=1
end









create proc DIEMTHITCQP_HOCKY(@msv nvarchar(15),@namhoc NVARCHAR(15)) AS
begin
	select DiemMonHoc.DiemThi
	from DiemMonHoc inner join MonHoc on DiemMonHoc.MaMH=MonHoc.MaMonHoc
	where DiemMonHoc.MaSV =@msv and DiemMonHoc.NamHoc=@namhoc and MonHoc.MaCN is null
end




create proc DSSV_XETHB(@namhoc NVARCHAR(20),@khoahoc NVARCHAR(10),@namhocdiemrl NVARCHAR(15),@diemrlhocky NVARCHAR(15),@makhoa NVARCHAR(5),@diemxet float) as
begin
	Select DiemMonHoc.MaSV,SinhVien.Hoten,Lop.Tenlop,DiemMonHoc.NamHoc,DiemRL.Tongdiem,
	ROUND(sum(MonHoc.SoTC*DiemMonHoc.DiemTongKet)/sum(MonHoc.SoTC),1) AS 'DTBHE10', 
	ROUND(sum(MonHoc.SoTC*DiemMonHoc.DiemHe4)/sum(MonHoc.SoTC),2) AS 'DTBHE4', 
	sum(MonHoc.SoTC) AS 'TongSoTCHocTrongKy'
	From (((SinhVien left join DiemMonHoc on SinhVien.MSV=DiemMonHoc.MaSV)
					left join MonHoc on DiemMonHoc.MaMH=MonHoc.MaMonHoc)
					left join DiemRL on SinhVien.MSV=DiemRL.MSVien and (DiemRL.Namhoc=@namhocdiemrl or DiemRL.Namhoc is null) and (DiemRL.Hocky=@diemrlhocky or DiemRL.Hocky is null)) 
					,Lop
	where MonHoc.MaCN is not null and DiemMonHoc.NamHoc=@namhoc  and SinhVien.Malop=Lop.Malop and Lop.Makhoa=@makhoa and Lop.Khoa=@khoahoc and DiemMonHoc.LanHoc=1
	group by DiemMonHoc.MaSV,SinhVien.Hoten,DiemMonHoc.NamHoc,DiemRL.Tongdiem,Lop.Tenlop
	having sum(MonHoc.SoTC*DiemMonHoc.DiemHe4)/sum(MonHoc.SoTC)>=2.5
	ORDER BY DTBHE4 DESC 
end


create proc SOTIEN_1TC(@makhoa NVARCHAR(5)) AS
begin
	select SoTien1TC from Khoa where Makhoa=@makhoa
end


SELECT MAX(DiemTBTL.TBCHe4)
  FROM DiemTBTL
 WHERE DiemTBTL.TBCHe4 < (SELECT MAX(DiemTBTL.TBCHe4)
                 FROM DiemTBTL)


Create proc SV_Load AS
Begin
	select MSV,Hoten,AnhHoSo,Ngaysinh,Gioitinh,Dantoc,SDT,CMND,Email,Hedaotao,Hotenbo,Nghebo,Hotenme,Ngheme,TenTinh,Tenhuyen,Tenxa,Tenkhoa,Tenlop,Tinhtrang,NamnhapHoc 
	from SinhVien, Lop, Khoa, Tinh, Huyen, Xa 
	where SinhVien.Maxa=Xa.Maxa and Xa.Mahuyen=Huyen.Mahuyen and Huyen.Matinh=Tinh.Matinh and SinhVien.Malop=Lop.Malop and Lop.Makhoa=Khoa.Makhoa 
	ORDER BY MSV ASC
End

create proc SV_LoadLop(@malop nvarchar(10)) AS
Begin
	select MSV,Hoten,AnhHoSo,Ngaysinh,Gioitinh,Dantoc,SDT,CMND,Email,Hedaotao,Hotenbo,Nghebo,Hotenme,Ngheme,TenTinh,Tenhuyen,Tenxa,Tenkhoa,Tenlop,Tinhtrang,NamnhapHoc 
	from SinhVien, Lop, Khoa, Tinh, Huyen, Xa 
	where SinhVien.Maxa=Xa.Maxa and Xa.Mahuyen=Huyen.Mahuyen and Huyen.Matinh=Tinh.Matinh and SinhVien.Malop=Lop.Malop and Lop.Makhoa=Khoa.Makhoa and SinhVien.Malop=@malop
End

/*Chay:*/


create Proc TongSoMonHoc(@hocky nvarchar(5),@makhoa nvarchar(5)) AS
begin
	select COUNT(*) from MonHoc where HocKy=@hocky and MaKhoa=@makhoa
end

create Proc TongSoSV(@malop nvarchar(5)) AS
begin
	select COUNT(*) from SinhVien where Malop=@malop
end


create Proc KTTinhDiemCaNam(@namhoc nvarchar(15),@masinhvien nvarchar(10)) AS
begin
	select COUNT(*) from DiemTBTL where NamHoc like '%'+@namhoc+'%' and MaSinhVien=@masinhvien
end


create Proc Lay2Diem2HocKy(@masinhvien nvarchar(10),@namhoc nvarchar(15)) AS
begin
	select top(2) DiemTBTL.MaSinhVien,DiemTBTL.DiemTBCHe10,DiemTBTL.TBCHe4,DiemTBTL.SoTCTL,DiemTBTL.SoTCTLTK
	from DiemTBTL where DiemTBTL.MaSinhVien=@masinhvien and DiemTBTL.NamHoc like '%'+@namhoc+'%'
end


create Proc DSMONHOC_MOLOP(@makhoa NVARCHAR(5)) AS
begin
	select MaMonHoc,TenMonHoc 
	from (MonHoc left join ChuyenNganh on MonHoc.MaCN=ChuyenNganh.MaChuyenNganh)
				left join Khoa on ChuyenNganh.Khoa=Khoa.Makhoa
	where MonHoc.MaCN is null or (ChuyenNganh.Khoa=Khoa.MaKhoa and Khoa.Makhoa=@makhoa)
	group by MaMonHoc,TenMonHoc 
	order by TenMonHoc
end








create Proc Insert_MOLOPHoc(@malop NVARCHAR(15),@tenlop NVARCHAR(150),@mamonhoc NVARCHAR(20),@mgv NVARCHAR(15),@thoigian NVARCHAR(120),@diadiem NVARCHAR(50),@siso NVARCHAR(3),@makhoa NVARCHAR(5),@namhoc NVARCHAR(30)) AS
begin
	insert into LopHocPhan values(@malop,@tenlop,@mamonhoc,@namhoc,@mgv,@thoigian,@diadiem,@siso,@makhoa)
end

drop Proc Insert_MOLOPHoc 


create Proc LIST_LOPHOC AS
begin
	select LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.NamHoc,GiangVien.Hoten,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,
	COUNT(KetQuaDangKy.MaLopHoc) AS 'DaDangKy',MonHoc.SoTC,'Delete' AS [Delete]
	from (((LopHocPhan left join KetQuaDangKy on KetQuaDangKy.MaLopHoc=LopHocPhan.MaLopHP)
			left join MonHoc on LopHocPhan.MMH=MonHoc.MaMonHoc)
			left join GiangVien on LopHocPhan.GiangVien=GiangVien.MGV)
	group by LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.NamHoc,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,MonHoc.SoTC,GiangVien.Hoten
end






create Proc LIST_LOPHOCTHEOKHOA(@makhoa NVARCHAR(15)) AS
begin
	select LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.NamHoc,GiangVien.Hoten,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,
	COUNT(KetQuaDangKy.MaLopHoc) AS 'DaDangKy',MonHoc.SoTC,'Delete' AS [Delete]
	from (((LopHocPhan left join KetQuaDangKy on KetQuaDangKy.MaLopHoc=LopHocPhan.MaLopHP)
			left join MonHoc on LopHocPhan.MMH=MonHoc.MaMonHoc)
			left join GiangVien on LopHocPhan.GiangVien=GiangVien.MGV),ChuyenNganh
	where MonHoc.MaCN=ChuyenNganh.MaChuyenNganh and ChuyenNganh.Khoa=@makhoa
	group by LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.NamHoc,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,MonHoc.SoTC,GiangVien.Hoten
end












create Proc DELETE_LOPHOC(@malop NVARCHAR(15)) AS
begin
	delete from LopHocPhan where MaLopHP=@malop
end

create Proc DELETE_SINHVIENTRONGLOPHOC(@malop NVARCHAR(15)) AS
begin
	delete from KetQuaDangKy where MaLopHoc=@malop
end



create Proc LIST_LOPHOCTHEOMONHOC(@mmh NVARCHAR(20)) AS
begin
	select LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,
	COUNT(KetQuaDangKy.MaLopHoc) AS 'DaDangKy',MonHoc.SoTC
	from ((LopHocPhan left join KetQuaDangKy on KetQuaDangKy.MaLopHoc=LopHocPhan.MaLopHP)
			left join MonHoc on LopHocPhan.MMH=MonHoc.MaMonHoc)
	where LopHocPhan.MMH=@mmh
	group by LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,MonHoc.SoTC
end




create proc DANHSACHLOP_HIENTHIDADANGKY(@malop NVARCHAR(15)) AS
begin
	select LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,
	COUNT(KetQuaDangKy.MaLopHoc) AS 'DaDangKy',MonHoc.SoTC
	from ((LopHocPhan left join KetQuaDangKy on KetQuaDangKy.MaLopHoc=LopHocPhan.MaLopHP)
				left join MonHoc on LopHocPhan.MMH=MonHoc.MaMonHoc)
	where LopHocPhan.MaLopHP=@malop
	group by LopHocPhan.MaLopHP,LopHocPhan.TenLopHp,MonHoc.TenMonHoc,LopHocPhan.ThoiGian,LopHocPhan.DiaDiem,LopHocPhan.SiSo,MonHoc.SoTC
end



create proc DANHSACHLOP_DK(@masinhvien NVARCHAR(10)) AS
begin
 select KetQuaDangKy.MaLopHoc from KetQuaDangKy where KetQuaDangKy.MaSinhVien=@masinhvien
end




create proc KIEMTRADADANGKYLOPMONHOCNAYCHUA(@mamonhoc NVARCHAR(20),@msv NVARCHAR(10)) AS
begin
	select COUNT(*) 
	from KetQuaDangKy,LopHocPhan,MonHoc
	where KetQuaDangKy.MaLopHoc=LopHocPhan.MaLopHP and LopHocPhan.MMH=MonHoc.MaMonHoc and MonHoc.MaMonHoc=@mamonhoc and KetQuaDangKy.MaSinhVien=@msv
end


create proc KIEMTRADADANGKYLOPNAYCHUA(@malophoc NVARCHAR(20),@msv NVARCHAR(10)) AS
begin
	select COUNT(*) from KetQuaDangKy where KetQuaDangKy.MaSinhVien=@msv and KetQuaDangKy.MaLopHoc=@malophoc
end





create proc SoTHANGDADANGKYLOPNAY(@malop NVARCHAR(20)) AS
begin
	select COUNT(*) from KetQuaDangKy where MaLopHoc=@malop
end




create Proc DSGIANGVIEN_MOLOP(@makhoa NVARCHAR(15)) AS
begin
	select MGV,Hoten from GiangVien where Khoa=@makhoa
end


create Proc LIST_MonHocTheoKhoa(@makhoa NVARCHAR(5)) AS
begin
	select MonHoc.MaMonHoc,MonHoc.TenMonHoc 
	from MonHoc,LopHocPhan,ChuyenNganh
	where MonHoc.MaMonHoc=LopHocPhan.MMH and (MonHoc.MaCN=ChuyenNganh.MaChuyenNganh or MonHoc.MaCN is null) and ChuyenNganh.khoa=@makhoa
	group by MonHoc.MaMonHoc,MonHoc.TenMonHoc
end


create Proc MaKhoaSV(@msv NVARCHAR(10)) AS
begin
	Select Khoa.Makhoa from SinhVien,Lop,Khoa
	where SinhVien.Malop=Lop.Malop and Lop.Makhoa=Khoa.Makhoa and SinhVien.MSV=@msv
end





create table LopHocPhan
(
	MaLopHP NVARCHAR(10) primary key,
	TenLopHP NVARCHAR(150),
	MMH NVARCHAR(10),
	NamHoc NVARCHAR(30),
	GiangVien NVARCHAR(10),
	ThoiGian NVARCHAR(150),
	DiaDiem NVARCHAR(50),
	SiSo int,
	Khoa int,
	CONSTRAINT fk_str23s FOREIGN KEY (MMH) 
    REFERENCES MonHoc(MaMonHoc),
	CONSTRAINT fk_str233s FOREIGN KEY (Khoa) 
    REFERENCES Khoa(MaKhoa),
	CONSTRAINT fk_str1996 FOREIGN KEY (GiangVien) 
    REFERENCES GiangVien(MGV)
)


create table KetQuaDangKy
(
	MaDangKy INT IDENTITY(1,1) primary key,
	MaSinhVien int,
	MaLopHoc NVARCHAR(10),
	CONSTRAINT fk_str233sxx FOREIGN KEY (MaLopHoc) 
    REFERENCES LopHocPhan(MaLopHP),
	CONSTRAINT fk_str233sxxxs FOREIGN KEY (MaSinhVien) 
    REFERENCES SinhVien(MSV)
)



/*Tính điểm TB:*/


create proc TinhDiemTBTL(@Namhoc NVARCHAR(20),@Malop NVARCHAR(10))
AS
Begin
	Select DiemMonHoc.MaSV,SinhVien.Hoten,DiemMonHoc.NamHoc,
	ROUND(sum(MonHoc.SoTC*DiemMonHoc.DiemTongKet)/sum(MonHoc.SoTC),1) AS 'DTBHE10', 
	sum(MonHoc.SoTC*DiemMonHoc.DiemHe4)/sum(MonHoc.SoTC) AS 'DTBHE4', 
	sum(MonHoc.SoTC) AS 'TongSoTC'
	From DiemMonHoc inner join SinhVien on SinhVien.MSV=DiemMonHoc.MaSV
					inner join MonHoc on MonHoc.MaMonHoc=DiemMonHoc.MaMH
	where MonHoc.MaCN is not null and DiemMonHoc.NamHoc=@Namhoc and SinhVien.Malop=@Malop
	group by DiemMonHoc.MaSV,SinhVien.Hoten,DiemMonHoc.NamHoc
end


/**************/

Select DiemMonHoc.MaSV,SinhVien.Hoten,DiemMonHoc.NamHoc,
ROUND(sum(MonHoc.SoTC*DiemMonHoc.DiemTongKet)/sum(MonHoc.SoTC),1) AS 'DTBHE10', 
sum(MonHoc.SoTC*DiemMonHoc.DiemHe4)/sum(MonHoc.SoTC) AS 'DTBHE4', 
sum(MonHoc.SoTC) AS 'TongSoTCHocTrongKy'
From DiemMonHoc inner join SinhVien on SinhVien.MSV=DiemMonHoc.MaSV
				inner join MonHoc on MonHoc.MaMonHoc=DiemMonHoc.MaMH
where MonHoc.MaKhoa is not null and DiemMonHoc.NamHoc='2017 - 2018_2' and SinhVien.Malop=4 and DiemMonHoc.LanHoc=1
group by DiemMonHoc.MaSV,SinhVien.Hoten,DiemMonHoc.NamHoc
	
	

create proc TongSoTCTichLuy(@namhoc NVARCHAR(20),@msv NVARCHAR(10)) AS
begin
	select sum(MonHoc.SoTC) AS 'TongSoTCTL'
	From DiemMonHoc inner join SinhVien on SinhVien.MSV=DiemMonHoc.MaSV
					inner join MonHoc on MonHoc.MaMonHoc=DiemMonHoc.MaMH
where MonHoc.MaCN is not null and DiemMonHoc.NamHoc=@namhoc and DiemMonHoc.DiemChu!='F' and SinhVien.MSV=@msv
end



create proc TinhSoTinChiTrongHocKy_THEOKHOA(@makhoa NVARCHAR(10),@hockythu NVARCHAR(2))
AS
Begin
	select sum(MonHoc.SoTC) AS 'TongSoTC'
	from MonHoc,ChuyenNganh
	where MonHoc.MaCN=ChuyenNganh.MaChuyenNganh and ChuyenNganh.Khoa=@makhoa and MonHoc.Hocky=@hockythu
end





create proc SVXemDTBC(@masinhvien nvarchar(10)) AS
begin
	select NamHoc,DiemTBCHe10,TBCHe4,SoTCTL,SoTCTLTK from DiemTBTL where MaSinhVien=@masinhvien 
end


create proc SinhVien_KTDTB(@msv NVARCHAR(10),@namhoc NVARCHAR(25)) AS
begin
	select COUNT(*) from DiemTBTL where MaSinhVien=@msv and NamHoc=@namhoc
end


create proc TBC_insert(@msv NVARCHAR(10),@namhoc NVARCHAR(20),@diemhe10 NVARCHAR(5),@diemhe4 NVARCHAR(5),@tongtc NVARCHAR(3),@tongtctrongky NVARCHAR(3)) AS
begin
	insert into DiemTBTL(MaSinhVien,NamHoc,DiemTBCHe10,TBCHe4,SoTCTL,SoTCTLTK) values (@msv,@namhoc,@diemhe10,@diemhe4,@tongtc,@tongtctrongky)
end


create proc TBC_update(@msv NVARCHAR(10),@namhoc NVARCHAR(20),@diemhe10 NVARCHAR(5),@diemhe4 NVARCHAR(5),@tongtc NVARCHAR(3),@tongtctrongky NVARCHAR(3)) AS
begin
	update DiemTBTL set DiemTBCHe10=@diemhe10,TBCHe4=@diemhe4,SoTCTL=@tongtc,SoTCTLTK=@tongtctrongky where MaSinhVien=@msv and NamHoc=@namhoc
end


create proc XemDiemTBTL(@namhoc NVARCHAR(20),@malop NVARCHAR(10)) AS
begin
	select DiemTBTL.MaSinhVien,SinhVien.Hoten,DiemTBTL.NamHoc,DiemTBTL.DiemTBCHe10,DiemTBTL.TBCHe4,DiemTBTL.SoTCTL,DiemTBTL.SoTCTLTK
	from  DiemTBTL inner join SinhVien on DiemTBTL.MaSinhVien=SinhVien.MSV
	where SinhVien.Malop=@malop and DiemTBTL.NamHoc=@namhoc
end


select DiemMonHoc.MaSoDiem,SinhVien.MSV,SinhVien.HoTen,MonHoc.TenMonHoc,DiemMonHoc.Diem1,DiemMonHoc.Diem2,DiemMonHoc.DiemThi,DiemMonHoc.DiemTongKet,DiemMonHoc.DiemChu,DiemMonHoc.DanhGia 
from ((DiemMonHoc 
	inner join SinhVien on SinhVien.MSV=DiemMonHoc.MaSV)
	inner join MonHoc on DiemMonHoc.MaMH=MonHoc.MaMonHoc)
where MonHoc.MaMonHoc='MH02'

select DiemMonHoc.MaSoDiem,MonHoc.TenMonHoc,DiemMonHoc.Diem1,DiemMonHoc.Diem2,DiemMonHoc.DiemThi,DiemMonHoc.DiemTongKet,DiemMonHoc.DiemChu,DiemMonHoc.DanhGia 
from (DiemMonHoc inner join MonHoc on DiemMonHoc.MaMH=MonHoc.MaMonHoc)
where DiemMonHoc.MaSV=17

select SinhVien.MSV,SinhVien.HoTen,Canbo.Username
from SinhVien left join Canbo on CAST(SinhVien.MSV AS varchar(8)) = Canbo.Username
where SinhVien.Malop=4

select GiangVien.MGV,GiangVien.HoTen,Canbo.Username
from GiangVien left join Canbo on GiangVien.MGV = Canbo.Username
where GiangVien.Khoa=1



/*Nhap diem*/
SELECT SinhVien.MSV, DiemMonHoc.MaMH,SinhVien.Hoten,DiemMonHoc.Diem1,DiemMonHoc.Diem2,DiemMonHoc.DiemThi
FROM SinhVien
LEFT OUTER JOIN DiemMonHoc ON DiemMonHoc.MaSV = SinhVien.MSV and DiemMonHoc.MaMH='MH02'
where SinhVien.Malop=4
/*OK*/

CREATE FUNCTION [dbo].[ufn_removeMark] (@text nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
	SET @text = LOWER(@text)
	DECLARE @textLen int = LEN(@text)
	IF @textLen > 0
	BEGIN
		DECLARE @index int = 1
		DECLARE @lPos int
		DECLARE @SIGN_CHARS nvarchar(100) = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýđð'
		DECLARE @UNSIGN_CHARS varchar(100) = 'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyydd'
		WHILE @index <= @textLen
		BEGIN
			SET @lPos = CHARINDEX(SUBSTRING(@text,@index,1),@SIGN_CHARS)
			IF @lPos > 0
			BEGIN
				SET @text = STUFF(@text,@index,1,SUBSTRING(@UNSIGN_CHARS,@lPos,1))
			END
			SET @index = @index + 1
		END
	END
	RETURN @text
END


select * from KetQuaDangKy
select * from LopHocPhan

insert into KetQuaDangKy values(2,'H2COOH')
insert into KetQuaDangKy values(1,'H2COOH')



create proc DangKY_LopHoc(@masinhvien NVARCHAR(10),@malophoc NVARCHAR(15)) AS
begin
	insert into KetQuaDangKy values (@masinhvien,@malophoc)
end


create proc HuyDangKY_LopHoc(@masinhvien NVARCHAR(10),@malophoc NVARCHAR(15)) AS
begin
	delete from KetQuaDangKy where MaSinhVien=@masinhvien and MaLopHoc=@malophoc
end


/*
create table LopChuyenNganh
(
	MaLopChuyenNganh NVARCHAR(15),
	TenLopChuyenNganh NVARCHAR(60),
	ChuyenNganh NVARCHAR(15),
	CONSTRAINT fk_ss1dxdsx FOREIGN KEY (ChuyenNganh) 
    REFERENCES ChuyenNganh(MaChuyenNganh)
)
*/
create table ChuyenNganh
(
	MaChuyenNganh NVARCHAR(15) primary key,
	TenChuyenNganh NVARCHAR(60),
	Khoa INT,
	CONSTRAINT fk_ss1dxds FOREIGN KEY (Khoa) 
    REFERENCES Khoa(MaKhoa)
)

create proc TAOCHUYENNGANH(@machuyennganh NVARCHAR(15),@tenchuyennganh NVARCHAR(60),@makhoa NVARCHAR(10)) AS
begin
	insert into ChuyenNganh values(@machuyennganh,@tenchuyennganh,@makhoa)
end


create proc DANHSACHTATCACHUYENNGANH AS
begin
	select ChuyenNganh.MaChuyenNganh,ChuyenNganh.TenChuyenNganh,Khoa.TenKhoa from ChuyenNganh,Khoa where ChuyenNganh.Khoa=Khoa.Makhoa
end


create proc DANHSACHTATCACHUYENNGANHTHEOKHOA(@makhoa NVARCHAR(10)) AS
begin
	select ChuyenNganh.MaChuyenNganh,ChuyenNganh.TenChuyenNganh,Khoa.TenKhoa from ChuyenNganh,Khoa where ChuyenNganh.Khoa=Khoa.Makhoa and Khoa.Makhoa=@makhoa
end


create proc XOACHUYENNGANH(@machuyennganh NVARCHAR(15)) AS
begin
	delete from ChuyenNganh where MaChuyenNganh=@machuyennganh
end

create proc SUACHUYENNGANH(@machuyennganh NVARCHAR(15),@tenchuyennganh NVARCHAR(60),@makhoa NVARCHAR(10)) AS
begin
	update ChuyenNganh set TenChuyenNganh=@tenchuyennganh,Khoa=@makhoa where MaChuyenNganh=@machuyennganh
end


create proc DANHSACHCHUYENNGANH(@makhoa NVARCHAR(10)) AS
begin
	select MaChuyenNganh,TenChuyenNganh from ChuyenNganh where Khoa=@makhoa
end

create proc DANHSACHCHUYENNGANHTATCA AS
begin
	select MaChuyenNganh,TenChuyenNganh from ChuyenNganh
end

create proc LOADTATCAMONHOC AS 
begin
	select MaMonHoc,TenMonHoc,SoTC,HocKy,TenChuyenNganh,Khoa.Tenkhoa
	from (MonHoc left join ChuyenNganh on MonHoc.MaCN=ChuyenNganh.MaChuyenNganh)
		  left join Khoa on ChuyenNganh.Khoa=Khoa.Makhoa		
end

			
create proc DANHSACHMONHOCTHEOCHUYENNGANH(@machuyennganh NVARCHAR(15),@chuyennganhchung NVARCHAR(15)) AS 
begin
	select MaMonHoc,TenMonHoc,SoTC,HocKy,TenChuyenNganh,Khoa.Tenkhoa
	from (MonHoc left join ChuyenNganh on MonHoc.MaCN=ChuyenNganh.MaChuyenNganh)
				 left join Khoa on ChuyenNganh.Khoa=Khoa.Makhoa
	where MonHoc.MaCN is null or MonHoc.MaCN=@chuyennganhchung or MonHoc.MaCN=@machuyennganh
end


create proc DANHSACHMONHOCTHEOKHOATHEOKY(@hocky NVARCHAR(5),@makhoa NVARCHAR(10)) AS
begin
	select MaMonHoc,TenMonHoc,Khoa.Tenkhoa 
	from (MonHoc left join ChuyenNganh on MonHoc.MaCN=ChuyenNganh.MaChuyenNganh)
				 left join Khoa on ChuyenNganh.Khoa=Khoa.Makhoa
	where MonHoc.HocKy=@hocky and (MonHoc.MaCN is null or (ChuyenNganh.Khoa=Khoa.Makhoa and MaKhoa=@makhoa))
end




drop proc DANHSACHMONHOCTHEOCHUYENNGANH

create proc MACHUYENNGANHCHUNGTHEOKHOA(@makhoa NVARCHAR(10)) AS 
begin
	select MaChuyenNganh 
	from ChuyenNganh,Khoa
	where ChuyenNganh.Khoa=Khoa.Makhoa and Khoa.Makhoa=@makhoa and ChuyenNganh.TenChuyenNganh='Chung'
end





create proc MAKHOA(@machuyennganh NVARCHAR(10)) AS 
begin
	select Khoa from ChuyenNganh where MaChuyenNganh=@machuyennganh
end





create proc KIEMTRA_SINHVIENDANGKYHOC(@msv NVARCHAR(10),@mamonhoc NVARCHAR(20)) AS
begin
	select DiemMonHoc.DiemChu
	from SinhVien left join DiemMonHoc on DiemMonHoc.MaSV=SinhVien.MSV
	where DiemMonHoc.MaMH=@mamonhoc and DiemMonHoc.MaSV=@msv
end




create proc DANHSACH_CACLOPDANGDAY(@mgv NVARCHAR(15)) AS
begin
	select MaLopHP,TenLopHP
	from LopHocPhan 
	where LopHocPhan.GiangVien=@mgv
end



create proc DANHSACHSINHVIENTRONGLOPHOCPHAN(@malop NVARCHAR(20),@namhoc NVARCHAR(30),@mmh NVARCHAR(25)) as
begin
	SELECT KetQuaDangKy.MaSinhVien,SinhVien.Hoten,Lop.TenLop,DiemMonHoc.Diem1,DiemMonHoc.Diem2,DiemMonHoc.DiemThi
	from KetQuaDangKy inner join SinhVien on KetQuaDangKy.MaSinhVien=SinhVien.MSV and KetQuaDangKy.MaLopHoc=@malop
					left join Lop on SinhVien.Malop=Lop.Malop
					left join DiemMonHoc on KetQuaDangKy.MaSinhVien=DiemMonHoc.MaSV and DiemMonHoc.NamHoc=@namhoc and DiemMonHoc.MaMH=@mmh
end






create proc MAMONHOCTRONGLOPHOCPHAN(@malophocphan NVARCHAR(20)) AS
begin
	select MonHoc.MaMonHoc
	from MonHoc,LopHocPhan
	where MonHoc.MaMonHoc=LopHocPhan.MMH and LopHocPhan.MaLopHP=@malophocphan
end



create proc NAMHOC_LOPHOCPHAN(@malophocphan NVARCHAR(15)) AS
begin
	select NamHoc from LopHocPhan where MaLopHP=@malophocphan
end


create proc SOLANHOC_SINHVIEN(@msv NVARCHAR(10),@mmh NVARCHAR(20)) AS
begin
	select COUNT(*) from DiemMonHoc where DiemMonHoc.MaSV=@msv and DiemMonHoc.MaMH=@mmh
end



create proc SOTIEN1TC_SINHVIENDKHOC(@malophocphan NVARCHAR(20)) AS
begin
	select Khoa.SoTien1TC
	from KetQuaDangKy left join LopHocPhan on LopHocPhan.MaLopHP=KetQuaDangKy.MaLopHoc
					  left join MonHoc on LopHocPhan.MMH=MonHoc.MaMonHoc
					  left join ChuyenNganh on MonHoc.MaCN=ChuyenNganh.MaChuyenNganh
					  left join Khoa on ChuyenNganh.Khoa = Khoa.Makhoa
	where KetQuaDangKy.MaLopHoc=@malophocphan
	group by Khoa.SoTien1TC
end

