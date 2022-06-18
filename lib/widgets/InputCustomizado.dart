// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

class InputCustomizado extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType type;

  const InputCustomizado({
    required this.controller,
    required this.label,
    required this.hint,
    required this.type,
  });

  mask() {
    if (label == 'Telefone') {
      return [
        MaskedInputFormatter('(00) 00000-0000',
            allowedCharMatcher: RegExp(r'[A-Z]'))
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
              child: TextFormField(
                inputFormatters: mask(),
                controller: controller,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: hint,
                  labelText: label,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: type,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
