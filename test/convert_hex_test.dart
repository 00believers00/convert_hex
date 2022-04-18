import 'package:flutter_test/flutter_test.dart';
import 'package:convert_hex/convert_hex.dart';

void main() {
  test('Convert Hex', () {
    int dec = 1080;
    String sEncode= convertHex.hex.encode(dec);//'438'
    expect(sEncode, '438');
    int sDecode = convertHex.hex.decode(sEncode);//'1080'
    expect(sDecode, dec);
  });

  test('Convert Base 64 RFC 4648', () {
    int dec = 4096;
    String sEncode = convertHex.base64.encode(dec);
    expect(sEncode, 'BAA');
    int sDecode = convertHex.base64.decode(sEncode);
    expect(sDecode, dec);
  });
}

