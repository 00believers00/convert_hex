import 'dart:math';

class Hex {
  String encode(int dec) {
    int mod = 16;
    int count = dec;
    List<int> hexList = [];
    for (; count > 0;) {
      var ans1 = count / mod;
      var mod1 = ans1.round();
      var ans = count - (mod1 * mod);
      if (ans < 0) {
        mod1 -= 1;
        ans = count - ((mod1) * mod);
      }
      count = mod1;
      hexList.add(ans);
    }
    int length = hexList.length - 1;
    String hex = '';
    for (int i = length; i >= 0; i--) {
      var num = hexList[i];
      if (num < mod) {
        if (num > 9) {
          hex += _charEncode(num);
        } else {
          hex += num.toString();
        }
      }
    }

    return hex;
  }

  int decode(String hex) {
    int value = 0;
    if (hex.isNotEmpty) {
      var array = hex.split('');
      var i = 0;
      for (int count = hex.length - 1; count >= 0; count--) {
        int a = int.tryParse(array[i]) ?? _charDecode(array[i]);
        value += (a * pow(16, count)).round();
        i++;
      }
    }
    return value;
  }

  int _charDecode(String hex) {
    switch (hex.toUpperCase()) {
      case 'A':
        return 10;
      case 'B':
        return 11;
      case 'C':
        return 12;
      case 'D':
        return 13;
      case 'E':
        return 14;
      case 'F':
        return 15;
      default:
        return 0;
    }
  }

  String _charEncode(int dec) {
    switch (dec) {
      case 10:
        return 'A';
      case 11:
        return 'B';
      case 12:
        return 'C';
      case 13:
        return 'D';
      case 14:
        return 'E';
      case 15:
        return 'F';
      default:
        return "0";
    }
  }

  int? charDecode(String hex) {
    switch (hex.toUpperCase()) {
      case 'A':
        return 10;
      case 'B':
        return 11;
      case 'C':
        return 12;
      case 'D':
        return 13;
      case 'E':
        return 14;
      case 'F':
        return 15;
      default:
        return int.tryParse(hex);
    }
  }

  String? charEncode(int dec) {
    switch (dec) {
      case 10:
        return 'A';
      case 11:
        return 'B';
      case 12:
        return 'C';
      case 13:
        return 'D';
      case 14:
        return 'E';
      case 15:
        return 'F';
      default:
        if(dec<10&&dec>=0){
          return '$dec';
        }
        return null;
    }
  }
}