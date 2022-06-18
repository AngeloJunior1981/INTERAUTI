// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tea/telas/inicial.dart';

void main() => runApp(MaterialApp(
      home: Inicial(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff795548),
          //accentColor: Colors.green
          scaffoldBackgroundColor: Color(0xfff5e9b9)),
    ));
