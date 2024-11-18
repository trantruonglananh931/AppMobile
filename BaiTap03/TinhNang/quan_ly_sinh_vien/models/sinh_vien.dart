//lop SV
class SinhVien{
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  SinhVien(this._hoTen,this._tuoi,this._maSV,this._diemTB);

  //getter
  String get hoTen => _hoTen;
  set hoTen(String hoTen){
    if(hoTen.isEmpty){
      _hoTen = hoTen;
    }else{
      print("Ho ten khong duoc rong");
    }
  }

  int get tuoi => _tuoi;
  /* set tuoi(int tuoi){
    if(tuoi>0){
      _tuoi = tuoi;
    }else{
      print("Tuoi phai > 0");
    }
  } */
  set tuoi(int tuoi){
    _tuoi = (tuoi>0)?tuoi:_tuoi;
  }
  

  String get maSV => _maSV;
  set maSV (String maSV){
    if(maSV.isEmpty){
      _maSV = maSV;
    }
  }

  double get diemTB => _diemTB;
  set diemTB (double diemTB){
    _diemTB = diemTB;
  }

  void hienThiThongTin(){
    print("Ho ten :  $_hoTen");
    print("Tuoi : $_tuoi");
    print("Ma so sinh vien : $_maSV");
    print("Diem trung binh : $_diemTB");
  }

  String xepLoai(){
    if(_diemTB>=8.0) return "Gioi";
    if(_diemTB>=6.5) return "Trung binh";
    if(_diemTB>=5) return "Kha";
    return "Yeu"; 
  }
}