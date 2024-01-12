USE WS_EZM_IPHONE
GO

-- 1 imei = 1 chiếc điện thoại
-- 1 sản phẩm có nhiều imei
CREATE TABLE IMEI(
	Imei		VARCHAR(5) PRIMARY KEY,
	MaSanPham	INT FOREIGN KEY
		REFERENCES SanPham(MaSanPham)
);

INSERT INTO IMEI VALUES
	('IM001', 4),
	('IM002', 4),
	('IM003', 3),
	('IM004', 1),
	('IM005', 2)

SELECT sp.MaSanPham, 'iPhone ' + TenDongSanPham + ' ' + TenPhienBan 
		+ ' ' + MauSac 
		+ ' ' + CONVERT(VARCHAR,DungLuong) +'GB' AS 'TenSanPham',
		COUNT(Imei) AS 'SoLuong'
 FROM SanPham sp
	LEFT JOIN DongSanPham dsp ON sp.MaDongSanPham = dsp.MaDongSanPham
	LEFT JOIN PhienBan pb ON pb.MaPhienBan = dsp.MaPhienBan
	LEFT JOIN IMEI im ON sp.MaSanPham = im.MaSanPham
	GROUP BY sp.MaSanPham, TenDongSanPham, TenPhienBan, MauSac,DungLuong