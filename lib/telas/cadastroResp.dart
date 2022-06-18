// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tea/telas/cadastroAut.dart';
import 'package:tea/widgets/InputCustomizado.dart';
import 'package:tea/widgets/SnackBarCustomizado.dart';

import '../models/usuario.dart';

class CadastroResponsavel extends StatefulWidget {
  late Future<Usuario> usu;
  CadastroResponsavel(this.usu);

  @override
  State<CadastroResponsavel> createState() => _CadastroResponsavelState();
}

class _CadastroResponsavelState extends State<CadastroResponsavel> {
  final formkey = GlobalKey<ScaffoldState>();
  final TextEditingController nomeRespController = TextEditingController();
  final TextEditingController telefoneRespController = TextEditingController();
  String textoBotao = "Cadastrar";

  @override
  void initState() {
    super.initState();
    existeUsuario();
  }

  validaResponsavel(String nome, String telefone) {
    if (nome.isEmpty) {
      return "Informe o nome do responsável";
    }
    if (telefone.isEmpty) {
      return "Informe o telefone do responsável";
    }
    return null;
  }

  existeUsuario() async {
    if (widget.usu.toString().isNotEmpty) {
      Usuario? user = await widget.usu;
      nomeRespController.text = user.nomeResp;
      telefoneRespController.text = user.telefone;
      setState(() {
        textoBotao = "Editar";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: 	AppBar(title: Text("Cadastro"),),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Responsável',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Montserrat Medium",
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 70, 0),
                      child: Text(
                        'Informe os dados do responsável',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InputCustomizado(
                controller: nomeRespController,
                label: "Nome",
                hint: "Nome",
                type: TextInputType.name),
            InputCustomizado(
                controller: telefoneRespController,
                label: "Telefone",
                hint: "Telefone",
                type: TextInputType.phone),
            Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                          color: Colors.blueAccent)))),
                      onPressed: () async {
                        var retorno = validaResponsavel(nomeRespController.text,
                            telefoneRespController.text);

                        (retorno != null)
                            ? snackbarCustomizado(context, retorno, Colors.red)
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CadastroAutista(
                                        nomeRespController.text,
                                        telefoneRespController.text)));
                      },
                      child: Text(
                        textoBotao,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
