import '../models/dien_thoai.dart'; 
import '../models/hoa_don.dart';

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor với tên và địa chỉ
  CuaHang(this._tenCuaHang, this._diaChi);

  // Các phương thức quản lý điện thoại
  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    for (int i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDienThoai == maDienThoai) {
        _danhSachDienThoai[i] = dienThoaiMoi;
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã $maDienThoai.');
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanh(String maDienThoai) {
    for (int i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDienThoai == maDienThoai) {
        _danhSachDienThoai[i].trangThai = false;
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã $maDienThoai.');
  }

  // Tìm kiếm điện thoại theo mã, tên hoặc hãng
  List<DienThoai> timKiemDienThoai({String? maDienThoai, String? tenDienThoai, String? hangSx}) {
    List<DienThoai> ketQua = [];
    for (var dienThoai in _danhSachDienThoai) {
      if ((maDienThoai != null && dienThoai.maDienThoai == maDienThoai) ||
          (tenDienThoai != null && dienThoai.tenDienThoai == tenDienThoai) ||
          (hangSx != null && dienThoai.hangSanXuat == hangSx)) {
        ketQua.add(dienThoai);
      }
    }
    return ketQua;
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    for (var dienThoai in _danhSachDienThoai) {
      print('Mã: ${dienThoai.maDienThoai}, Tên: ${dienThoai.tenDienThoai}, Hãng: ${dienThoai.hangSanXuat}, Giá nhập: ${dienThoai.giaNhap}, Giá bán: ${dienThoai.giaBan}, Số lượng tồn: ${dienThoai.soLuongTon}, Trạng thái: ${dienThoai.trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
    }
  }

  // Các phương thức quản lý hóa đơn
  // Tạo hóa đơn mới (tự động cập nhật tồn kho)
  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.soLuongMua > hoaDon.dienThoaiBan.soLuongTon) {
      print('Số lượng mua vượt quá số lượng tồn kho.');
      return;
    }
    hoaDon.dienThoaiBan.soLuongTon -= hoaDon.soLuongMua;
    _danhSachHoaDon.add(hoaDon);
  }

  // Tìm kiếm hóa đơn theo mã, ngày, khách hàng
  List<HoaDon> timKiemHoaDon({String? maHoaDon, DateTime? ngayBan, String? tenKhachHang}) {
    List<HoaDon> ketQua = [];
    for (var hoaDon in _danhSachHoaDon) {
      if ((maHoaDon != null && hoaDon.maHoaDon == maHoaDon) ||
          (ngayBan != null && hoaDon.ngayBan == ngayBan) ||
          (tenKhachHang != null && hoaDon.tenKhachHang == tenKhachHang)) {
        ketQua.add(hoaDon);
      }
    }
    return ketQua;
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTinHoaDon();
    }
  }

  // Các phương thức thống kê
  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0.0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hoaDon.tinhTongTien();
      }
    }
    return tongDoanhThu;
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double tongLoiNhuan = 0.0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        tongLoiNhuan += hoaDon.tinhLoiNhuan();
      }
    }
    return tongLoiNhuan;
  }

  // Thống kê top điện thoại bán chạy
  List<DienThoai> thongKeTopDienThoaiBanChay(int top) {
    Map<DienThoai, int> banChay = {};
    for (var hoaDon in _danhSachHoaDon) {
      if (banChay.containsKey(hoaDon.dienThoaiBan)) {
        banChay[hoaDon.dienThoaiBan] = banChay[hoaDon.dienThoaiBan]! + hoaDon.soLuongMua;
      } else {
        banChay[hoaDon.dienThoaiBan] = hoaDon.soLuongMua;
      }
    }

    var topDienThoai = banChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value))
      ..take(top);

    return topDienThoai.map((entry) => entry.key).toList();
  }

  // Thống kê tồn kho
  Map<String, int> thongKeTonKho() {
    Map<String, int> tonKho = {};
    for (var dienThoai in _danhSachDienThoai) {
      tonKho[dienThoai.tenDienThoai] = dienThoai.soLuongTon;
    }
    return tonKho;
  }
}
