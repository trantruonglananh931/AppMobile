
class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuon = false ;

  Sach(this._maSach,this._tenSach,this._tacGia,this._trangThaiMuon );

  //getset
  String get maSach => _maSach;
  set maSach(String maSach){
    if(maSach.isEmpty){
      _maSach = maSach;
    }
  }

  String get tenSach => _tenSach;
  set tenSach(String tenSach){
    if(tenSach.isEmpty){
      _tenSach = tenSach;
    }
  }

  String get tacGia => _tacGia;
  set tacGia(String tacGia){
    if(tacGia.isEmpty){
      _tacGia = tacGia;
    }
  }

  bool get trangThaiMuon => _trangThaiMuon;
  set trangThaiMuon(bool trangThaiMuon){
    _trangThaiMuon = trangThaiMuon;
  }

  //hient hi thong tin sach 
  void hienThiThongTin() {
    print('Mã sách: $_maSach');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái mượn: ${_trangThaiMuon ? "Đã mượn" : "Chưa mượn"}');
  }

}