import 'dienthoai.dart';

class HoaDon {

  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;


  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoaiDuocBan,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  );


  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;


  set maHoaDon(String maHoaDon) {
    if (maHoaDon.isNotEmpty && maHoaDon.startsWith("HD-")) {
      _maHoaDon = maHoaDon;
    } 
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now())) {
      _ngayBan = ngayBan;
    } 
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua > 0 && soLuongMua <= _dienThoaiDuocBan.soLuongTonKho) {
      _soLuongMua = soLuongMua;
    } 
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    } 
  }

  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isNotEmpty) {
      _tenKhachHang = tenKhachHang;
    } 
  }

  set soDienThoaiKhach(String soDienThoaiKhach) {
    if (soDienThoaiKhach.isNotEmpty &&
        soDienThoaiKhach.length == 10 &&
        soDienThoaiKhach.startsWith("0")) {
      _soDienThoaiKhach = soDienThoaiKhach;
    } 
  }


  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_ngayBan");
    print("Tên điện thoại: ${_dienThoaiDuocBan.tenDienThoai}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách: $_soDienThoaiKhach");
    print("Tổng tiền: ${tinhTongTien()}");
  }
}