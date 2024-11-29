

import '../02-BaiTapOOP/models/cuahang.dart';
import '../02-BaiTapOOP/models/dienthoai.dart';
import '../02-BaiTapOOP/models/hoadon.dart';

void main() {

  CuaHang cuaHang = CuaHang("Cửa Hàng ABC", "123 Đường ABC");


  DienThoai dt1 = DienThoai(
    "DT-001",
    "iPhone 16",
    "Apple",
    30000000,
    35000000,
    10,
    true,
  );

  DienThoai dt2 = DienThoai(
    "DT-002",
    "Samsung Galaxy S25",
    "Samsung",
    25000000,
    30000000,
    5,
    true,
  );


  // 3. Hiển thị danh sách điện thoại
  cuaHang.hienThiDanhSachDienThoai();

  // 4. Cập nhật thông tin điện thoại (kiểm tra mã tồn tại)
  DienThoai dtMoi = DienThoai(
    "DT-001",
    "iPhone 16 Pro",
    "Apple",
    33000000,
    38000000,
    8,
    true,
  );


  cuaHang.hienThiDanhSachDienThoai();

  // 5. Ngừng kinh doanh điện thoại
  cuaHang.ngungKinhDoanhDienThoai("DT-002");
  cuaHang.hienThiDanhSachDienThoai();

  // 6. Tạo hóa đơn bán hàng
  HoaDon hd1 = HoaDon(
    "HD-001",
    DateTime.now(),
    dtMoi,
    2,
    38000000,
    "Nguyễn  A",
    "0987698000",
  );

  cuaHang.taoHoaDonMoi(hd1);

  HoaDon hd2 = HoaDon(
    "HD-002",
    DateTime.now(),
    dt1,
    1,
    35000000,
    "Trần  B",
    "0987878821",
  );

  cuaHang.taoHoaDonMoi(hd2);

  // 7. Hiển thị danh sách hóa đơn
  cuaHang.hienThiDanhSachHoaDon();

  // 8. Tìm kiếm hóa đơn
  print("Kết quả tìm kiếm hóa đơn:");
  cuaHang.timKiemHoaDon("HD-001");

  // 9. Tính toán doanh thu
  double doanhThu = cuaHang.tinhTongDoanhThu(
    DateTime(2024, 1, 1),
    DateTime.now(),
  );
  print("Tổng doanh thu: $doanhThu");

  // 10. Thống kê điện thoại bán chạy
  int tongDienThoaiBan = cuaHang.demTongDienThoaiBanChay();
  print("Tổng số điện thoại đã bán: $tongDienThoaiBan");

  // 11. Thống kê tồn kho
  cuaHang.thongKeTonKho();
}