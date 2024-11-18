import 'sach.dart';

class DocGia {
  // Thuộc tính
  String _maDocGia;
  String _hoTen;
  List<Sach> _danhSachDangMuon = [];

  // Constructor
  DocGia(this._maDocGia, this._hoTen, [List<Sach>? danhSachDangMuon]) {
    if (danhSachDangMuon != null) {
      _danhSachDangMuon = danhSachDangMuon;
    }
  }

  // Getter và Setter cho maDocGia với điều kiện
  String get maDocGia => _maDocGia;
  set maDocGia(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Mã độc giả không được rỗng.");
    }
    _maDocGia = value;
  }

  // Getter và Setter cho hoTen với điều kiện
  String get hoTen => _hoTen;
  set hoTen(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Họ tên không được rỗng.");
    }
    _hoTen = value;
  }

  // Getter cho danhSachDangMuon
  List<Sach> get danhSachDangMuon => _danhSachDangMuon;

  // Phương thức mượn sách
  void muonSach(Sach sach) {
    // Kiểm tra sách đã có người mượn chưa
    if (sach.trangThaiMuon) {
      print('Sách "${sach.tenSach}" đã được mượn.');
      return;
    }

    // Thêm sách vào danh sách mượn
    _danhSachDangMuon.add(sach);

    // Cập nhật trạng thái sách
    sach.trangThaiMuon = true;

    print('Đã mượn sách "${sach.tenSach}".');
  }

  // Phương thức trả sách
  void traSach(String maSach) {
    // Tìm sách trong danh sách mượn
    Sach? sach = _danhSachDangMuon.firstWhere(
      (s) => s.maSach == maSach,
      orElse: () => throw Exception('Không tìm thấy sách có mã "$maSach" trong danh sách mượn.')
    );

    // Xóa sách khỏi danh sách mượn
    _danhSachDangMuon.remove(sach);

    // Cập nhật trạng thái sách
    sach.trangThaiMuon = false;

    print('Đã trả sách "${sach.tenSach}".');
  }

  // Phương thức hiển thị danh sách sách đang mượn
  void hienThiDanhSachMuon() {
    print('Danh sách sách đang mượn của $_hoTen:');
    if (_danhSachDangMuon.isEmpty) {
      print('Không có sách nào.');
    } else {
      for (var sach in _danhSachDangMuon) {
        print('- ${sach.tenSach} (Mã: ${sach.maSach})');
      }
    }
  }
}
