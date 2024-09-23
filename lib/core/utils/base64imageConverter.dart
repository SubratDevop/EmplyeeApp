//^ convert base64 to image
// ignore_for_file: file_names

import 'dart:convert';
import 'dart:typed_data';

Uint8List decodeBase64ToImage(String base64String) {
  return base64Decode(base64String);
}

buildImageFromBase64(String base64String) {
  Uint8List imageBytes = decodeBase64ToImage(base64String);
  return imageBytes;
}
