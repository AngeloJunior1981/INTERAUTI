// ignore_for_file: file_names

import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarCustomizado(
    BuildContext context, retorno, Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        retorno,
        style: const TextStyle(
            fontFamily: "Montserrat Regular", color: Colors.white),
      )));
}
