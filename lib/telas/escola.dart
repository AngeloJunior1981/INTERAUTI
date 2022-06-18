// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, prefer_const_constructors, duplicate_ignore, unused_local_variable, prefer_const_constructors_in_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tea/Core/local.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/widgets/AppBarCustomizado.dart';
import 'package:tea/widgets/ItemCategory.dart';

class Escola extends StatefulWidget {
  late Future<Usuario> usu;
  Escola(this.usu);
  @override
  _EscolaState createState() => _EscolaState();
}

class _EscolaState extends State<Escola> {
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
            title: 'Bom dia',
            imageName: 'bom_dia',
            audioName: 'Bom_dia',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Boa tarde',
            imageName: 'boa_tarde',
            audioName: 'boa_tarde',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Até amanhã',
            imageName: 'ate_amanha',
            audioName: 'ate_amanha',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Estudar',
            imageName: 'livro',
            audioName: 'eu_quero_estudar',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Água',
            imageName: 'sede',
            audioName: 'Eu_quero_beber_agua',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Banheiro',
            imageName: 'banheiro',
            audioName: 'quero_ir_ao_banheiro',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Fome',
            imageName: 'lanchar',
            audioName: 'estou_com_fome',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Tirar dúvida',
            imageName: 'ajuda',
            audioName: 'poderia_explicar_novamente',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Passando mal',
            imageName: 'passar_mal',
            audioName: 'passando_mal',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Terminei exercício',
            imageName: 'fim_exercicio',
            audioName: 'terminei_o_exercicio',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Prazer em conhecer',
            imageName: 'prazer_conhecer',
            audioName: 'prazer_em_conhecer',
            sexo_audio: 'fem',
          ),
        ],
      ),
    );
  }
}
