// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, prefer_const_constructors, duplicate_ignore, unused_local_variable, prefer_const_constructors_in_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tea/Core/local.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/widgets/AppBarCustomizado.dart';
import 'package:tea/widgets/ItemCategory.dart';

class Alimentacao extends StatefulWidget {
  late Future<Usuario> usu;
  Alimentacao(this.usu);

  @override
  _AlimentacaoState createState() => _AlimentacaoState();
}

class _AlimentacaoState extends State<Alimentacao> {
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
            title: 'Água',
            imageName: 'sede',
            audioName: 'Eu_quero_beber_agua',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Suco',
            imageName: 'suco',
            audioName: 'Eu_quero_beber_suco',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Chá',
            imageName: 'cha',
            audioName: 'Eu_quero_beber_cha',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Café',
            imageName: 'cafe',
            audioName: 'Eu_quero_beber_cafe',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Pão',
            imageName: 'pao',
            audioName: 'Eu_quero_comer_pao',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Biscoito',
            imageName: 'biscoito',
            audioName: 'Eu_quero_comer_biscoito',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Bolo',
            imageName: 'bolo',
            audioName: 'Eu_quero_comer_bolo',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Sanduiche',
            imageName: 'lanchar',
            audioName: 'Eu_quero_comer_sanduiche',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Carne',
            imageName: 'carne',
            audioName: 'Eu_quero_comer_carne',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Frango',
            imageName: 'frango',
            audioName: 'Eu_quero_comer_frango',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Salsisha',
            imageName: 'salsicha',
            audioName: 'Eu_quero_comer_salsicha',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Arroz',
            imageName: 'arroz',
            audioName: 'Eu_quero_comer_arroz',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Feijão',
            imageName: 'feijao',
            audioName: 'Eu_quero_comer_feijao',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Leite',
            imageName: 'leite',
            audioName: 'Eu_quero_beber_leite',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Banana',
            imageName: 'banana',
            audioName: 'Eu_quero_comer_banana',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Maçã',
            imageName: 'maca',
            audioName: 'Eu_quero_comer_maca',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Abacaxi',
            imageName: 'abacaxi',
            audioName: 'Eu_quero_comer_abacaxi',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Uva',
            imageName: 'uva',
            audioName: 'Eu_quero_comer_uva',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Melancia',
            imageName: 'melancia',
            audioName: 'Eu_quero_comer_melancia',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Pipoca',
            imageName: 'pipoca',
            audioName: 'Eu_quero_comer_pipoca',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Pizza',
            imageName: 'pizza',
            audioName: 'Eu_quero_comer_Pizza',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Hamburguer',
            imageName: 'hamburguer',
            audioName: 'Eu_quero_comer_hamburguer',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Batata Frita',
            imageName: 'batata_frita',
            audioName: 'Eu_quero_comer_batata_frita',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Sorvete',
            imageName: 'sorvete',
            audioName: 'Eu_quero_tomar_sorvete',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Chocolate',
            imageName: 'chocolate',
            audioName: 'Eu_quero_comer_chocolate',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Ovo',
            imageName: 'ovo',
            audioName: 'Eu_quero_comer_ovo',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Queijo',
            imageName: 'queijo',
            audioName: 'Eu_quero_comer_queijo',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Salada',
            imageName: 'salada',
            audioName: 'Eu_quero_comer_salada',
            sexo_audio: 'fem',
          ),
        ],
      ),
    );
  }
}
