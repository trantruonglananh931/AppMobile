import "../models/cua_hang.dart";
import "../models/dien_thoai.dart";
import "../models/hoa_don.dart";
void main() {
  // Create a store
  CuaHang cuaHang = CuaHang('Điện thoại X', '123 Đường ABC');

  // Create some phone objects
  DienThoai dienThoai1 = DienThoai('DT-001', 'iPhone 15', 'Apple', 500, 700, 100, true);
  DienThoai dienThoai2 = DienThoai('DT-002', 'Samsung Galaxy S24', 'Samsung', 400, 600, 50, true);

  // Add phones to the store
  cuaHang.themDienThoai(dienThoai1);
  cuaHang.themDienThoai(dienThoai2);

  // Create a customer and invoice
  HoaDon hoaDon = HoaDon('HD-001', DateTime.now(), dienThoai1, 2, 750, 'Nguyễn Văn A', '0901234567');

  // Add the invoice to the store
  cuaHang.taoHoaDon(hoaDon);

  // Display phone list and invoice list
  cuaHang.hienThiDanhSachDienThoai();
  cuaHang.hienThiDanhSachHoaDon();

  // Display statistics
  print('Tổng doanh thu: ${cuaHang.tinhTongDoanhThu(DateTime.now().subtract(Duration(days: 30)), DateTime.now())}');
  print('Tổng lợi nhuận: ${cuaHang.tinhTongLoiNhuan(DateTime.now().subtract(Duration(days: 30)), DateTime.now())}');
}
