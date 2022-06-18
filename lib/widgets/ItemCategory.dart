// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, prefer_const_constructors, must_be_immutable, prefer_final_fields, prefer_interpolation_to_compose_strings, non_constant_identifier_names, library_private_types_in_public_api

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tea/config/Pallete.dart';

class ItemCategory extends StatefulWidget {
  String title;
  String imageName;
  String audioName;
  String sexo_audio;
  ItemCategory(
      {required this.title,
      required this.imageName,
      required this.sexo_audio,
      required this.audioName});

  @override
  _ItemCategoryState createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  void initState() {
    super.initState();
  }

  AudioCache _audioCache = AudioCache(prefix: "assets/audios/");

  _executar(String nomeAudio) {
    _audioCache.play(nomeAudio + ".mp3");
  }

  Color _cor = Colors.white;
  var _fontSize = 21.0;
  var _width = 96.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _fontSize = _fontSize == 21.0 ? 25.0 : 21.0;
          _cor = _cor == Colors.white ? Color(0xffF99F38) : Colors.white;
          setState(() {});
          _executar(widget.audioName + "_" + widget.sexo_audio);
        },
        child: Card(
            color: _cor,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: _fontSize,
                      fontFamily: 'Oswald'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/" + widget.imageName + ".png",
                        width: _width,
                      ),
                      Text(
                        widget.title,
                      )
                    ],
                  )),
            ])));
  }
}
