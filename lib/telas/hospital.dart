// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, prefer_const_constructors, duplicate_ignore, unused_local_variable, prefer_const_constructors_in_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tea/Core/local.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/widgets/AppBarCustomizado.dart';
import 'package:tea/widgets/ItemCategory.dart';

class Hospital extends StatefulWidget {
  late Future<Usuario> usu;
  Hospital(this.usu);
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
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
            title: 'Medicação',
            imageName: 'remedio',
            audioName: 'Acabou_a_medicacao',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Dor',
            imageName: 'dor',
            audioName: 'Estou_com_dor',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Soro',
            imageName: 'soro',
            audioName: 'Acabou_o_soro',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Diagnóstico',
            imageName: 'diagnostico',
            audioName: 'Qual_meu_diagnostico',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Exame',
            imageName: 'exames',
            audioName: 'Qual_ou_quais_exames_devo_fazer',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Calafrios',
            imageName: 'calafrio',
            audioName: 'Estou_com_calafrio',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Náuseas',
            imageName: 'enjoado',
            audioName: 'Estou_com_nauseas',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Dor de cabeça',
            imageName: 'dor_cabeca',
            audioName: 'Estou_com_dor_de_cabeca',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Estou com febre',
            imageName: 'febre',
            audioName: 'Estou com febre',
            sexo_audio: 'fem',
          ),
        ],
      ),
    );
  }
}
