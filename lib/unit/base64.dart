import 'dart:convert';
import 'dart:math';

class Base64 {
  //format RFC 4648

  String encode(int dec) {
    int mod = 64;
    int count = dec;
    List<int> hexList = [];
    if(count == 0){
      return _asciiTo64(count);
    }
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
        hex += _asciiTo64(num);
      }
    }

    return hex;
  }

  int decode(String hex) {
    int mod = 64;
    int value = 0;
    if (hex.isNotEmpty) {
      var array = hex.split('');
      var i = 0;
      for (int count = hex.length - 1; count >= 0; count--) {
        int a = int.tryParse(array[i]) ?? _base64ToDexAscii(array[i]);
        value += (a * pow(mod, count)).round();
        i++;
      }
    }
    return value;
  }

  int _base64ToDexAscii(String base64){
    var num = -1;
    num =  const AsciiCodec().encode(base64)[0];

    if(num >= 48 && num <= 57){
      num += 4;}
    else if(num >= 65 && num <= 90){
      num -= 65;}
    else if(num >= 97 && num <= 122){
      num -= 71;}
    else if(num == 43){num = 62;}
    else if(num == 47){num = 63;}
    return num;
  }

  String _asciiTo64(int ascii){
    var num = ascii;

    if(num >= 0 && num <= 25){
      num += 65;}
    else if(num >= 26 && num <= 51){
      num += 71;}
    else if(num >= 52 && num <= 61){
      num -= 4;}
    else if(num == 62){num = 43;}
    else if(num == 63){num = 47;}

    return String.fromCharCode(num);
  }
}