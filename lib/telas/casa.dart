// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, prefer_const_constructors, duplicate_ignore, unused_local_variable, prefer_const_constructors_in_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tea/Core/local.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/widgets/AppBarCustomizado.dart';
import 'package:tea/widgets/ItemCategory.dart';

class Casa extends StatefulWidget {
  late Future<Usuario> usu;
  Casa(this.usu);
  @override
  _CasaState createState() => _CasaState();
}

class _CasaState extends State<Casa> {
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
            title: 'Acordar',
            imageName: 'acordar',
            audioName: 'Bom_dia',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Fome',
            imageName: 'lanchar',
            audioName: 'estou_com_fome',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Café da manhã',
            imageName: 'cafe_da_manha',
            audioName: 'vamos_tomar_cafe_da_manha',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Almoço',
            imageName: 'almocar',
            audioName: 'vamos_almocar',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Banho',
            imageName: 'banho',
            audioName: 'vou_tomar_banho',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Escovar Dentes',
            imageName: 'escovar_dentes',
            audioName: 'vou_escovar_os_dentes',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Roupa',
            imageName: 'roupa',
            audioName: 'quero_escolher_minha_roupa',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Se vestir',
            imageName: 'se_vestir',
            audioName: 'vou_me_vestir',
            sexo_audio: 'fem',
          ),
        ],
      ),
    );
  }
}
