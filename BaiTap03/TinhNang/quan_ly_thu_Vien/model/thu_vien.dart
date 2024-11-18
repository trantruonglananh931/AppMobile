import 'sach.dart';  // Nhớ import các lớp cần thiết
import 'doc_gia.dart'; 

class ThuVien {
  // Thuộc tính: danh sách sách và danh sách độc giả
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  // Getter cho danh sách sách và danh sách độc giả
  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  // Phương thức thêm sách
  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print('Đã thêm sách: "${sach.tenSach}"');
  }

  // Phương thức thêm độc giả
  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print('Đã thêm độc giả: "${docGia.hoTen}"');
  }

  // Phương thức hiển thị danh sách sách
  void hienThiDanhSachSach() {
    print('Danh sách sách trong thư viện:');
    if (_danhSachSach.isEmpty) {
      print('Không có sách nào.');
    } else {
      for (var sach in _danhSachSach) {
        print('- ${sach.tenSach} (Mã: ${sach.maSach})');
      }
    }
  }
}
