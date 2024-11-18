
import '../model/lop_hoc.dart';
import '../model/sinh_vien.dart';

//Test
void main() {
  var sv = SinhVien("Nguyen Van A", 20, "SV001", 8.5);
 /*  print("Test getter : ${sv._hoTen}");
  sv.hoTen = "Nguyen Van B";
  print("Sau khi test : ${sv._hoTen}"); */
  print("Xep loai : ${sv.xepLoai()}");

  var lop = LopHoc('21DTHB5');
  lop.themSinhVien(SinhVien('Nguyen Van A', 30, "SV01", 8));
  lop.themSinhVien(SinhVien('Nguyen Van B', 30, "SV02", 6));
  lop.themSinhVien(SinhVien('Nguyen Van B', 30, "SV03", 4));

  lop.hienThiDanhSach();
}