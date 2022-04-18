## Features
function convert encode and decode, Base 16 HEX and Base 64 RFC 4648.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

### Add dependency

Please check the latest version before installation.
If there is any problem with the new version, please use the previous version

```yaml
dependencies:
  flutter:
    sdk: flutter
  # add convert_hex
  convert_hex: ^{latest version}
```

### Add the following imports to your Dart code

```dart
import 'package:convert_hex/convert_hex.dart';
```

## Example

### Use Hex
```dart
import 'package:convert_hex/convert_hex.dart';

int dec = 1080;
String sEncode= convertHex.hex.encode(dec);
print(sEncode);//'438'
int sDecode = convertHex.hex.decode(sEncode);
print(sDecode);//'1080'
```

### Use base64 RFC 4648
```dart
import 'package:convert_hex/convert_hex.dart';

int dec = 4096;
String sEncode = convertHex.base64.encode(dec);
print(sEncode);//'BAA'
int sDecode = convertHex.base64.decode(sEncode);
print(sDecode);//4096
```
