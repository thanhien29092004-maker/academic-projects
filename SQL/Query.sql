-- a. Thống kê các sản phẩm chưa được mua lần nào. Thông tin hiển thị gồm: Tên sản phẩm, tên danh mục, tên thương hiệu, tên nhà cung cấp.

select sp.TenSP, dm.TenDM, th.MaTH, tk.HoTen Nhacungcap
from sanpham sp, danhmuc dm, thuonghieu th, nhacungcap ncc, taikhoan tk
    where sp.MaSP = dm.MaSP 
    and sp.MaTH = th.MaTH 
    and ncc.MaTK = tk.MaTK
    and sp.MaSP = ncc.MaSP
    and (sp.MaSP not in (select MaSP from chitietdh ctdh))

--b. Thống kê số lượng sản phẩm theo từng thương hiệu. Thông tin hiển thị gồm: Tên thương hiệu, số lượng sản phẩm.

Select th.TenTH, Sum(sp.SLTon) soluongsanpham
From THUONGHIEU th, SANPHAM sp
Where th.MaTH = sp.MaTH 
Group by th.TenTH;

/*c. Lấy thông tin sản phẩm có điểm đánh giá trung bình lớn nhất theo từng thương hiệu. 
Thông tin hiển thị gồm: Tên thương hiệu, tên sản phẩm, điểm đánh giá trung bình.*/

Select th.TenTH,sp.TenSP, AVG(dg.Diem) as THdanhgia_MAX
From THUONGHIEU th, SANPHAM sp, DANHGIASP dg
Where th.MaTH =sp.MaTH and dg.MaSP = sp.MaSP 
GROUP BY th.TenTH,sp.TenSP
HAVING AVG(dg.Diem)  = (Select Max(TrB.diemtrb) 
From THUONGHIEU th,(Select th.MaTH,AVG(dg.Diem) diemtrb 
from DANHGIASP dg , SANPHAM sp, THUONGHIEU th 
Where dg.MaSP = sp.MaSP and th.MaTH = sp.MaTH
GROUP BY th.MaTH) as TrB)

/*d. Lấy thông tin các sản phẩm có số lượng bán được ít hơn 10 trong tháng 1 năm 2024 
của tài khoản (người bán) "XYZ" (sinh viên thay thế lại giá trị cho phù hợp với dữ liệu thu thập). 
Các thông tin hiển thị: Tên sản phẩm, số lượng bán được.*/

select sp.MaSP, sp.TenSP ,Sum(ctdh.SoLuong) SoLuongBan 
from 
	sanpham sp, chitietdh ctdh, donhang dh, NHACUNGCAP ncc
where sp.MaSP = ctdh.MaSP 
	and dh.MaDH = ctdh.MaDH 
	and ncc.MaSP =sp.MaSP
	and ncc.MaTK = '0301TK002'
	and dh.DatHang_Date between '2024-01-01' and '2024-01-31' 
	group by sp.MaSP,sp.TenSP
	Having Sum(ctdh.SoLuong) <10
/*e. Lấy thông tin các sản phẩm có số lượng bán được nhiều nhất trong từng tháng của năm 2023. 
Thông tin hiển thị gồm: Tháng, Tên sản phẩm, Số lượng bán được.*/

select * from ( 
SELECT
    MONTH(DH.GHTC_Date) AS Thang,
    SP.TenSP AS TenSanPham,
    SUM(CTDH.SoLuong) AS SoLuongBanDuocNhieuNhat
FROM
    DONHANG DH
    INNER JOIN CHITIETDH CTDH ON DH.MaDH = CTDH.MaDH
    INNER JOIN SANPHAM SP ON CTDH.MaSP = SP.MaSP
WHERE
    YEAR(DH.GHTC_Date) = 2023
GROUP BY
    MONTH(DH.GHTC_Date),
    SP.TenSP
HAVING
    SUM(CTDH.SoLuong) = (
        SELECT TOP 1
            SUM(SoLuong)
        FROM
            DONHANG DHInner
            INNER JOIN CHITIETDH CTDHInner ON DHInner.MaDH = CTDHInner.MaDH
        WHERE
            YEAR(DHInner.GHTC_Date) = 2023
            AND MONTH(DHInner.GHTC_Date) = MONTH(DH.GHTC_Date)
        GROUP BY
            CTDHInner.MaSP
        ORDER BY
            SUM(SoLuong) DESC)) t
			order by Thang;

/*f. Thống kê tổng doanh thu của tài khoản (người bán) "XYZ" (sinh viên thay thế lại giá trị cho phù hợp với dữ liệu thu thập) 
trong từng tháng của năm 2023, chỉ tính đơn hàng thành công. Thông tin hiển thị gồm: Tháng, Tổng doanh thu.*/

select month(dh.GHTC_DATE) Thang, sum(ctdh.SoLuong*GiaBan*(1-GiamGia)) TongDoanhThu
from CHITIETDH ctdh, DONHANG dh, NHACUNGCAP ncc
where ncc.MaTK = '0301TK015'
and ctdh.MaSP = ncc.MaSP
and dh.MaDH = ctdh.MaDH
and year(dh.GHTC_DATE) = 2023
group by month(dh.GHTC_DATE)
;



