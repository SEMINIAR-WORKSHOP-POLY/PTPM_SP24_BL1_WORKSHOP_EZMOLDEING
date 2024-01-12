USE WS_EZM_IPHONE
GO

-- 1 Dòng sản phẩm - N Sản phẩm
--	-> Đặt khóa chính của 1 làm khóa phụ của N
CREATE TABLE SanPham(
	MaSanPham	INT IDENTITY(1,1) PRIMARY KEY,
	-- TenSanPham	NVARCHAR(50) NOT NULL,
	MauSac		VARCHAR(10) NOT NULL,
	DungLuong	INT NOT NULL,
	GiaHienHanh	MONEY NOT NULL DEFAULT 0,

	MaDongSanPham	INT FOREIGN KEY
		REFERENCES DongSanPham(MaDongSanPham)
);

SELECT MaSanPham, 'iPhone ' + TenDongSanPham + ' ' + TenPhienBan 
		+ ' ' + MauSac 
		+ ' ' + CONVERT(VARCHAR,DungLuong) +'GB'
 FROM SanPham sp
	LEFT JOIN DongSanPham dsp ON sp.MaDongSanPham = dsp.MaDongSanPham
	LEFT JOIN PhienBan pb ON pb.MaPhienBan = dsp.MaPhienBan