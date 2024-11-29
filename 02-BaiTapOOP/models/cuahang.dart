
import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];


  CuaHang(this._tenCuaHang, this._diaChi);


  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;


  set tenCuaHang(String tenCuaHang) {
    if (tenCuaHang.isNotEmpty) {
      _tenCuaHang = tenCuaHang;
    }
  }

  set diaChi(String diaChi) {
    if (diaChi.isNotEmpty) {
      _diaChi = diaChi;
    }
  }

  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print("Thêm điện thoại thành công: ${dienThoai.tenDienThoai}");
  }

  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.tenDienThoai = dienThoaiMoi.tenDienThoai;
        dt.hangSanXuat = dienThoaiMoi.hangSanXuat;
        dt.giaNhap = dienThoaiMoi.giaNhap;
        dt.giaBan = dienThoaiMoi.giaBan;
        dt.soLuongTonKho = dienThoaiMoi.soLuongTonKho;
        print("Cập nhật thông tin điện thoại thành công.");
        return;
      }
    }
    print("Không tìm thấy điện thoại cần cập nhật.");
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.trangThai = false;
        print("Ngừng kinh doanh điện thoại: ${dt.tenDienThoai}");
        return;
      }
    }
    print("Không tìm thấy điện thoại cần ngừng kinh doanh.");
  }


  void timKiemDienThoai(String keyword) {
    var ketQua = _danhSachDienThoai.where((dt) =>
        dt.maDienThoai.contains(keyword) ||
        dt.tenDienThoai.contains(keyword) ||
        dt.hangSanXuat.contains(keyword));
    if (ketQua.isEmpty) {
      print("Không tìm thấy điện thoại.");
    } else {
      print("Kết quả tìm kiếm:");
      for (var dt in ketQua) {
        dt.hienThiThongTin();
      }
    }
  }

  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại trong cửa hàng:");
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }


  void taoHoaDonMoi(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);

    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == hoaDon.dienThoaiDuocBan.maDienThoai) {
        dt.soLuongTonKho -= hoaDon.soLuongMua;
      }
    }
    print("Tạo hóa đơn mới thành công: ${hoaDon.maHoaDon}");
  }

  void timKiemHoaDon(String keyword) {
    var ketQua = _danhSachHoaDon.where((hd) =>
        hd.maHoaDon.contains(keyword) ||
        hd.tenKhachHang.contains(keyword) ||
        hd.soDienThoaiKhach.contains(keyword));
    if (ketQua.isEmpty) {
      print("Không tìm thấy hóa đơn.");
    } else {
      print("Kết quả tìm kiếm hóa đơn:");
      for (var hd in ketQua) {
        hd.hienThiThongTin();
      }
    }
  }

  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTin();
    }
  }

  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0;
    for (var hd in _danhSachHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hd.tinhTongTien();
      }
    }
    return tongDoanhThu;
  }

  int demTongDienThoaiBanChay() {
    return _danhSachHoaDon.fold(
        0, (tong, hd) => tong + hd.soLuongMua);
  }

  void thongKeTonKho() {
    print("Thống kê tồn kho:");
    for (var dt in _danhSachDienThoai) {
      print(
          "Tên: ${dt.tenDienThoai}, Mã: ${dt.maDienThoai}, Số lượng tồn: ${dt.soLuongTonKho}");
    }
  }
}