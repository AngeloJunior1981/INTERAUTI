// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:radio_grouped_buttons/radio_grouped_buttons.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/telas/home.dart';

import 'package:tea/widgets/InputCustomizado.dart';
import 'package:tea/widgets/SnackBarCustomizado.dart';

import '../Core/local.dart';
import '../config/funcoes.dart';

class CadastroAutista extends StatefulWidget {
  final String responsavelnome;
  final String responsaveltel;
  const CadastroAutista(this.responsavelnome, this.responsaveltel);

  // ignore: prefer_const_constructors_in_immutables

  @override
  State<CadastroAutista> createState() => _CadastroAutistaState();
}

class _CadastroAutistaState extends State<CadastroAutista> {
  late final String nomeresp;
  late final String telefoneresp;
  Usuario? user;
  List<String> buttonList = ["Masculino", "Feminino"];
  List<String> buttonValues = ["masc", "fem"];
  int escolhaIndex = 1;
  String botaoLabel = "Cadastrar";
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController nomeMaeController = TextEditingController();
  final TextEditingController nomePaiController = TextEditingController();
  final TextEditingController ativGostaController = TextEditingController();
  final TextEditingController ativNGostaController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      nomeresp = widget.responsavelnome;
      telefoneresp = "+55${widget.responsaveltel}";
      getUsuario();
    });
  }

  Future<Usuario> getUsuarioLocal() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      return Local().getUser();
    });
  }

  salvarUsuario(Usuario usuario) async => await Local().save(usuario);

  getUsuario() async {
    user = await getUsuarioLocal();
    if (user.toString().isNotEmpty) {
      nomeController.text = user!.nome;
      telefoneController.text = user!.telefone;
      idadeController.text = user!.idade;
      cidadeController.text = user!.cidadeNasc;
      nomeMaeController.text = user!.nomeMae;
      nomePaiController.text = user!.nomePai;
      ativGostaController.text = user!.ativGosta;
      ativNGostaController.text = user!.ativNGosta;
      sexoController.text = user!.sexo;
      setState(() {
        botaoLabel = "Editar";
        verificaSexo();
      });
    }
  }

  verificaSexo() =>
      (sexoController.text != "fem") ? escolhaIndex = 0 : escolhaIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: 	AppBar(title: Text("Cadastro"),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
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
                      'Meus Dados',
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
                          'Informe os dados da criança',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InputCustomizado(
                  controller: nomeController,
                  label: "Nome Completo",
                  hint: "Nome",
                  type: TextInputType.name),
              InputCustomizado(
                  controller: idadeController,
                  label: "Idade",
                  hint: "Idade",
                  type: TextInputType.number),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Row(
                  children: [
                    const Text("Sexo:"),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: CustomRadioButton(
                        buttonLables: buttonList,
                        buttonValues: buttonValues,
                        radioButtonValue: (value, escolhaIndex) {
                          sexoController.text = value;
                        },
                        initialSelection: escolhaIndex,
                        horizontal: true,
                        enableShape: true,
                        buttonSpace: 5,
                        buttonColor: Colors.white,
                        selectedColor: Colors.blue,
                        //buttonWidth: 150,
                      ),
                    ),
                  ],
                ),
              ),
              InputCustomizado(
                  controller: telefoneController,
                  label: "Telefone",
                  hint: "Telefone",
                  type: TextInputType.phone),
              InputCustomizado(
                  controller: cidadeController,
                  label: "Cidade",
                  hint: "Cidade de nascimento",
                  type: TextInputType.text),
              InputCustomizado(
                  controller: nomeMaeController,
                  label: "Nome da mãe",
                  hint: "Nome da mãe",
                  type: TextInputType.text),
              InputCustomizado(
                  controller: nomePaiController,
                  label: "Nome do pai",
                  hint: "Nome do pai",
                  type: TextInputType.text),
              InputCustomizado(
                  controller: ativGostaController,
                  label: "Atividade que gosta",
                  hint: "Atividade que gosta",
                  type: TextInputType.text),
              InputCustomizado(
                  controller: ativNGostaController,
                  label: "Atividade que não gosta",
                  hint: "Atividade que não gosta",
                  type: TextInputType.text),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        color: Colors.blueAccent)))),
                        onPressed: () async {
                          Usuario usuario = Usuario(
                              nomeresp,
                              telefoneresp,
                              nomeController.text,
                              idadeController.text,
                              sexoController.text,
                              telefoneController.text,
                              cidadeController.text,
                              nomeMaeController.text,
                              nomePaiController.text,
                              ativGostaController.text,
                              ativNGostaController.text);
                          var retorno = validaDados(usuario);
                          if (retorno == null) {
                            salvarUsuario(usuario);

                            Navigator.of(context)
                                .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (Route<dynamic> route) => false)
                                .then((value) => setState(() => {}));

                            if (botaoLabel == "Editar") {
                              retorno = "Dados alterados com sucesso";
                            } else {
                              retorno = "Cadastro efetuado com sucesso";
                            }

                            snackbarCustomizado(context, retorno, Colors.blue);
                          } else {
                            snackbarCustomizado(context, retorno, Colors.red);
                          }
                        },
                        child: Text(
                          botaoLabel,
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
