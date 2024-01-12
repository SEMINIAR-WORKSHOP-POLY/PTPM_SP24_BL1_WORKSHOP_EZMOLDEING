CREATE DATABASE WS_EZM_IPHONE
GO
USE WS_EZM_IPHONE
GO

CREATE TABLE PhienBan(
	MaPhienBan	INT IDENTITY(1,1) PRIMARY KEY,
	TenPhienBan	VARCHAR(5) NOT NULL,
);
GO

CREATE TABLE DongSanPham(
	MaDongSanPham	INT IDENTITY(1,1) PRIMARY KEY,
	TenDongSanPham	NVARCHAR(20) NOT NULL,

	MaPhienBan	INT	
		FOREIGN KEY REFERENCES PhienBan(MaPhienBan)
);
GO

-- Thông số kỹ thuật: Chip, Camera, Hệ điều hành
--	Sim, CPU,...
CREATE TABLE Camera(
	MaCamera	INT IDENTITY(1,1) PRIMARY KEY,
	TenCamera	NVARCHAR(20) NOT NULL
)
GO

-- Tạo bảng mới do N - N
--	1 dòng sản phẩm có nhiều camera
--	1 camera xuất hiện trong nhiều dòng sản phẩm
CREATE TABLE DongSanPham_Camera(
	MaDongSanPham	INT 
		FOREIGN KEY REFERENCES DongSanPham(MaDongSanPham),
	MaCamera		INT
		FOREIGN KEY REFERENCES Camera(MaCamera),

	PRIMARY KEY(MaDongSanPham, MaCamera)
);

SELECT 'iPhone ' + TenDongSanPham + ' ' + TenPhienBan 
	FROM DongSanPham dsp
	LEFT JOIN PhienBan pb ON dsp.MaPhienBan = pb.MaPhienBan
	WHERE pb.MaPhienBan = 5

SELECT TenDongSanPham, TenCamera FROM DongSanPham dsp
	RIGHT JOIN DongSanPham_Camera dspc 
		ON dsp.MaDongSanPham = dspc.MaDongSanPham
	LEFT JOIN Camera c
		ON c.MaCamera = dspc.MaCamera
	