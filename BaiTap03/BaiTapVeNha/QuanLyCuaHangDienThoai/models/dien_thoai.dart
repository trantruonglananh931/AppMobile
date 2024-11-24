class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat, this._giaNhap,
      this._giaBan, this._soLuongTon, this._trangThai) {
    // Kiểm tra validation trong constructor
    if (_maDienThoai.isEmpty || !_maDienThoai.startsWith('DT-')) {
      throw ArgumentError('Mã điện thoại không hợp lệ, phải bắt đầu với "DT-"');
    }
    if (_tenDienThoai.isEmpty) {
      throw ArgumentError('Tên điện thoại không được rỗng.');
    }
    if (_hangSanXuat.isEmpty) {
      throw ArgumentError('Hãng sản xuất không được rỗng.');
    }
    if (_giaNhap <= 0) {
      throw ArgumentError('Giá nhập phải lớn hơn 0.');
    }
    if (_giaBan <= 0 || _giaBan <= _giaNhap) {
      throw ArgumentError('Giá bán phải lớn hơn giá nhập và phải lớn hơn 0.');
    }
    if (_soLuongTon < 0) {
      throw ArgumentError('Số lượng tồn phải lớn hơn hoặc bằng 0.');
    }
  }

  // Getter và Setter cho các thuộc tính
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isEmpty || !value.startsWith('DT-')) {
      throw ArgumentError('Mã điện thoại không hợp lệ, phải bắt đầu với "DT-"');
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên điện thoại không được rỗng.');
    }
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Hãng sản xuất không được rỗng.');
    }
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) {
      throw ArgumentError('Giá nhập phải lớn hơn 0.');
    }
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= 0 || value <= _giaNhap) {
      throw ArgumentError('Giá bán phải lớn hơn giá nhập và phải lớn hơn 0.');
    }
    _giaBan = value;
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value < 0) {
      throw ArgumentError('Số lượng tồn phải lớn hơn hoặc bằng 0.');
    }
    _soLuongTon = value;
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    if (_soLuongTon <= 0) {
      return 0;
    }
    return (_giaBan - _giaNhap) * _soLuongTon;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn: $_soLuongTon');
    print('Trạng thái: ${_trangThai ? 'Đang kinh doanh' : 'Không kinh doanh'}');
  }

  // Phương thức kiểm tra có thể bán không (còn hàng và đang kinh doanh)
  bool kiemTraCoBanDuoc() {
    return _soLuongTon > 0 && _trangThai;
  }
}
