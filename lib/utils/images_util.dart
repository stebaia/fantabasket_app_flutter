import 'dart:convert';
import 'dart:typed_data';

Uint8List imageFromBase64String(String base64String) {
  return base64Decode(base64String);
}
