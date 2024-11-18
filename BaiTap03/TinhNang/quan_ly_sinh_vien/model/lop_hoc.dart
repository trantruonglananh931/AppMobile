import 'sinh_vien.dart';
//class LopHoc
class LopHoc {
  String _tenLop;
  List<SinhVien> _danhSachSV = [];
  LopHoc(this._tenLop);

  //getter
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  //setter
  set tenLop(String tenLop){
    if(tenLop.isEmpty){
      _tenLop = tenLop;
    }
  }

  void themSinhVien(SinhVien sv){
    _danhSachSV.add(sv);
  }

  void hienThiDanhSach(){
    print("Danh sach sinh vien lop : $_tenLop");
    for (var sv in _danhSachSV){
      print("\n");
      sv.hienThiThongTin();
      print("Xep loai : ${sv.xepLoai()}");
    }
  }

}
