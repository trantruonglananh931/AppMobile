import '../model/sach.dart';
import '../model/doc_gia.dart';
import '../model/thu_vien.dart'; 

void main() {
  // Tạo các sách
  Sach sach1 = Sach("S001", "Dế Mèn Phiêu Lưu Ký", "Tô Hoài", false);
  Sach sach2 = Sach("S002","Lão Hạc", "Nam Cao", false);

  // Tạo độc giả
  DocGia docGia1 = DocGia("DG001", "Nguyễn Văn A");
  DocGia docGia2 = DocGia("DG002", "Trần Thị B");

  // Tạo thư viện
  ThuVien thuVien = ThuVien();

  // Thêm sách và độc giả vào thư viện
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);
  thuVien.themDocGia(docGia1);
  thuVien.themDocGia(docGia2);

  // Kiểm tra danh sách sách trong thư viện
  thuVien.hienThiDanhSachSach();

  // Kiểm tra quy trình mượn sách
  docGia1.muonSach(sach1); 
  docGia2.muonSach(sach2); 
  docGia1.hienThiDanhSachMuon();

  // Kiểm tra trả sách
  docGia1.traSach("S001");
  docGia1.hienThiDanhSachMuon();

  // Kiểm tra lại danh sách sách trong thư viện sau khi trả sách
  thuVien.hienThiDanhSachSach();
}
