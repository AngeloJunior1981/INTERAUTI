// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, prefer_const_constructors, duplicate_ignore, unused_local_variable, non_constant_identifier_names, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tea/Core/local.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/widgets/AppBarCustomizado.dart';
import 'package:tea/widgets/ItemCategory.dart';

class Sentimento extends StatefulWidget {
  late Future<Usuario> usu;
  Sentimento(this.usu);
  @override
  _SentimentoState createState() => _SentimentoState();
}

class _SentimentoState extends State<Sentimento> {
  Usuario? usuario;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.usu.toString().isEmpty) {
        getUsuario();
      }
    });
  }

  void getUsuario() async {
    usuario = await getUsuarioLocal();
  }

  Future<Usuario> getUsuarioLocal() {
    return Future.delayed(const Duration(seconds: 2), () {
      return Local().getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizado(widget.usu),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          ItemCategory(
            title: 'Beijo',
            imageName: 'beijo',
            audioName: 'Eu_quero_um_beijo',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Eu te amo',
            imageName: 'amor',
            audioName: 'Eu_te_amo',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Estou triste',
            imageName: 'triste',
            audioName: 'Estou_triste',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Estou feliz',
            imageName: 'feliz',
            audioName: 'Estou_feliz',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Eu quero um abraço',
            imageName: 'abraco',
            audioName: 'Eu_quero_um_abraco',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Estou com sono',
            imageName: 'sono',
            audioName: 'Estou_com_sono',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Estou bravo',
            imageName: 'irritado',
            audioName: 'Estou_bravo',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Não estou bem',
            imageName: 'enjoado',
            audioName: 'Não_estou_me_sentindo_bem',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Está barulhento',
            imageName: 'somAlto',
            audioName: 'Tem_muito_barulho_aqui',
            sexo_audio: 'fem',
          ),
        ],
      ),
    );
  }
}
