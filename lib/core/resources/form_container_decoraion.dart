import 'package:flutter/material.dart';

BoxDecoration formContainerDecoration(
    {Color? bgcolor, Color? borderColor, double? borderWidth}) {
  return BoxDecoration(
    color: bgcolor ?? const Color(0xFFF4F7F7),
    border: Border.all(
        color: borderColor ?? const Color(0xFF8595AB), width: borderWidth ?? 1),
    borderRadius: BorderRadius.circular(12),
  );
}
