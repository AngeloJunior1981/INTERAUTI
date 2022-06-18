// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, prefer_const_constructors, duplicate_ignore, unused_local_variable, prefer_const_constructors_in_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tea/Core/local.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/widgets/AppBarCustomizado.dart';
import 'package:tea/widgets/ItemCategory.dart';

class Transporte extends StatefulWidget {
  late Future<Usuario> usu;
  Transporte(this.usu);
  @override
  _TransporteState createState() => _TransporteState();
}

class _TransporteState extends State<Transporte> {
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
            title: 'Valor',
            imageName: 'passagem',
            audioName: 'qual_valor_da_passagem',
            sexo_audio: 'masc',
          ),
          ItemCategory(
            title: 'Passar',
            imageName: 'passar',
            audioName: 'poderia_me_dar_licenca',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Sentar',
            imageName: 'sentar',
            audioName: 'posso_sentar',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'diminuir o ar',
            imageName: 'frio',
            audioName: 'Poderia_abaixar_a_temperatura_do_ar',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Aumentar o ar',
            imageName: 'calor',
            audioName: 'Poderia_aumentar_a_temperatura_do_ar',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Troco',
            imageName: 'troco',
            audioName: 'Pode_ficar_com_o_troco',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Diminuir volume',
            imageName: 'diminuir_volume',
            audioName: 'Poderia_diminuir_o_volume_do_som',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Silêncio',
            imageName: 'silencio',
            audioName: 'Gostaria_de_ficar_em_silencio',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Abrir Janelas',
            imageName: 'abrir_janela',
            audioName: 'Poderia_abrir_a_janela',
            sexo_audio: 'fem',
          ),
          ItemCategory(
            title: 'Fechar Janela',
            imageName: 'fechar_janela',
            audioName: 'Poderia_fechar_janelas',
            sexo_audio: 'fem',
          ),
        ],
      ),
    );
  }
}
