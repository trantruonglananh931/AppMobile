import 'dart:io';
import 'dart:math';

void main() {
  String? continueAnswer;

  do {
    double a, b, c;
    print('\n==========================================');
    print('Chào mừng bạn đến với chương trình:');
    print('GIẢI PHƯƠNG TRÌNH BẬC 2: ax^2 + bx + c = 0');
    print('==========================================\n');

    // Kiểm tra nhập đúng giá trị a (a ≠ 0)
    do {
      stdout.write('Nhập hệ số a (a ≠ 0): ');
      String? inputA = stdin.readLineSync();

      // Kiểm tra nếu nhập giá trị hợp lệ cho a
      if (inputA != null && double.tryParse(inputA) != null) {
        a = double.parse(inputA);
      } else {
        a = 0.0;
      }

      if (a == 0) {
        print('❌ Không được để trống hoặc hệ số a bằng 0 hoặc là chữ. Vui lòng nhập lại.\n');
      }
    } while (a == 0);

    // Nhập hệ số b
    do {
      stdout.write('Nhập hệ số b: ');
      String? inputB = stdin.readLineSync();

      // Kiểm tra nếu nhập giá trị hợp lệ cho b
      if (inputB != null && double.tryParse(inputB) != null) {
        b = double.parse(inputB);
        break; // Nếu nhập hợp lệ, thoát khỏi vòng lặp
      } else {
        print('❌ Vui lòng nhập một số hợp lệ cho hệ số b.\n');
      }
    } while (true);

    // Nhập hệ số c
    do {
      stdout.write('Nhập hệ số c: ');
      String? inputC = stdin.readLineSync();

      // Kiểm tra nếu nhập giá trị hợp lệ cho c
      if (inputC != null && double.tryParse(inputC) != null) {
        c = double.parse(inputC);
        break; // Nếu nhập hợp lệ, thoát khỏi vòng lặp
      } else {
        print('❌ Vui lòng nhập một số hợp lệ cho hệ số c.\n');
      }
    } while (true);

    // Tính delta (discriminant)
    double delta = b * b - 4 * a * c;

    // Kiểm tra và giải phương trình
    print('\nKết quả:');
    if (delta > 0) {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      print('✅ Phương trình có 2 nghiệm phân biệt:');
      print('   x1 = $x1');
      print('   x2 = $x2');
    } else if (delta == 0) {
      double x = -b / (2 * a);
      print('✅ Phương trình có nghiệm kép:');
      print('   x = $x');
    } else {
      print('❌ Phương trình vô nghiệm.');
    }

    // Hỏi người dùng có muốn tiếp tục không
    do {
      stdout.write('\nBạn có muốn giải phương trình khác không? (y/n): ');
      continueAnswer = stdin.readLineSync()?.toLowerCase();

      if (continueAnswer != 'y' && continueAnswer != 'n') {
        print('❌ Vui lòng chỉ nhập "y" để tiếp tục hoặc "n" để kết thúc.');
      }
    } while (continueAnswer != 'y' && continueAnswer != 'n');
  } while (continueAnswer == 'y');

  print('\nChương trình kết thúc. Hẹn gặp lại!');
}
