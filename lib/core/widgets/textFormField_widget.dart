// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final Function()? onTap;

  const TextFieldWidget({
    super.key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
    this.errorText,
    required this.onTap,
  });

  @override
  TextFieldWidgetState createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextFormField(
              controller: controller,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
              decoration: InputDecoration(
                  errorText: widget.errorText != "" ? widget.errorText : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.25), width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.5),
                      borderRadius: BorderRadius.circular(12))),
              maxLines: widget.maxLines,
              onChanged: widget.onChanged,
              onTap: widget.onTap),
        ],
      );
}
