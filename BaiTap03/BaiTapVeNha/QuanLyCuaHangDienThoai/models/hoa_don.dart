import '../models/dien_thoai.dart'; // Import lớp DienThoai

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoaiBan,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  ) {
    // Kiểm tra validation trong constructor
    if (_maHoaDon.isEmpty || !_maHoaDon.startsWith('HD-')) {
      throw ArgumentError('Mã hóa đơn không hợp lệ, phải bắt đầu với "HD-"');
    }
    if (_ngayBan.isAfter(DateTime.now())) {
      throw ArgumentError('Ngày bán không thể sau ngày hiện tại.');
    }
    if (_soLuongMua <= 0 || _soLuongMua > _dienThoaiBan.soLuongTon) {
      throw ArgumentError('Số lượng mua phải lớn hơn 0 và nhỏ hơn hoặc bằng số lượng tồn kho.');
    }
    if (_giaBanThucTe <= 0) {
      throw ArgumentError('Giá bán thực tế phải lớn hơn 0.');
    }
    if (_tenKhachHang.isEmpty || _soDienThoaiKhach.isEmpty) {
      throw ArgumentError('Thông tin khách hàng không được rỗng.');
    }
    if (!_isValidPhoneNumber(_soDienThoaiKhach)) {
      throw ArgumentError('Số điện thoại khách hàng không hợp lệ.');
    }
  }

  // Getter và Setter cho các thuộc tính
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !value.startsWith('HD-')) {
      throw ArgumentError('Mã hóa đơn không hợp lệ, phải bắt đầu với "HD-"');
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw ArgumentError('Ngày bán không thể sau ngày hiện tại.');
    }
    _ngayBan = value;
  }

  DienThoai get dienThoaiBan => _dienThoaiBan;
  set dienThoaiBan(DienThoai value) {
    _dienThoaiBan = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > _dienThoaiBan.soLuongTon) {
      throw ArgumentError('Số lượng mua phải lớn hơn 0 và nhỏ hơn hoặc bằng số lượng tồn kho.');
    }
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw ArgumentError('Giá bán thực tế phải lớn hơn 0.');
    }
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên khách hàng không được rỗng.');
    }
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (value.isEmpty || !_isValidPhoneNumber(value)) {
      throw ArgumentError('Số điện thoại khách hàng không hợp lệ.');
    }
    _soDienThoaiKhach = value;
  }

  // Phương thức kiểm tra số điện thoại hợp lệ (định dạng đơn giản)
  bool _isValidPhoneNumber(String phoneNumber) {
    final regex = RegExp(r'^\d{10}$'); // Số điện thoại có 10 chữ số
    return regex.hasMatch(phoneNumber);
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuan() {
    return (_dienThoaiBan.giaBan - _dienThoaiBan.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Tên điện thoại bán: ${_dienThoaiBan.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận thực tế: ${tinhLoiNhuan()}');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
  }
}
