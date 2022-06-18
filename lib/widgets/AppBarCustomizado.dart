// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Core/local.dart';
import '../models/usuario.dart';

// ignore: must_be_immutable
class AppBarCustomizado extends StatefulWidget with PreferredSizeWidget {
  late Future<Usuario> usu;
  AppBarCustomizado(this.usu);

  @override
  State<AppBarCustomizado> createState() => _AppBarCustomizadoState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarCustomizadoState extends State<AppBarCustomizado> {
  Usuario? usuario;
  String? latitude;
  String? longitude;
  Position? position;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.usu.toString().isEmpty) {
        getUsuario();
        getPosition();
      }
    });
  }

  verificaPermissao() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  getPosition() async {
    verificaPermissao();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      latitude = (position.latitude).toString();
      longitude = (position.longitude).toString();
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

  Future<void> ligar(String telefone) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: telefone,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    bool boolcadastro = false;
    FlutterTts flutterTts = FlutterTts();
    return AppBar(
      title: FutureBuilder(
        future: widget.usu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            usuario = snapshot.data as Usuario;
            boolcadastro = true;
            return Text(usuario!.nome);
          } else {
            return const Text("Efetue o cadastro");
          }
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.emergency,
              color: Color.fromARGB(255, 238, 30, 15),
            ),
            onPressed: () {
              if (boolcadastro) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Ajuda!"),
                          content: Text(
                              "Enviar mensagem ou ligar para o ${usuario!.nomeResp}"),
                          actions: [
                            ElevatedButton(
                                onPressed: () async {
                                  getPosition();
                                  bool whatsapp = await FlutterLaunch.hasApp(
                                      name: "whatsapp");
                                  if (whatsapp) {
                                    await FlutterLaunch.launchWhatsapp(
                                        phone: usuario!.telefoneResp,
                                        message:
                                            "Olá ${usuario!.nomeResp} estou precisando de sua ajuda, minha localização é: https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                                child: const Text("Whatsapp")),
                            ElevatedButton(
                                onPressed: () async {
                                  ligar(usuario!.telefoneResp);
                                },
                                child: const Text("Ligar")),
                          ],
                        ));
              }
            }),
        IconButton(
            icon: const Icon(Icons.perm_identity),
            onPressed: () async {
              await flutterTts.setLanguage("pt-BR");
              flutterTts.speak('Olá, meu nome é  ' +
                  usuario!.nome +
                  ', tenho ' +
                  usuario!.idade +
                  ' anos, sou filho da ' +
                  usuario!.nomeMae +
                  ' e do ' +
                  usuario!.nomePai +
                  ', nasci em ' +
                  usuario!.cidadeNasc +
                  '. Eu gosto de ' +
                  usuario!.ativGosta +
                  ' e eu não gosto de ' +
                  usuario!.ativNGosta +
                  ' .Estou muito feliz em te conhecer.');
            }),
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Aviso!"),
                        content: Text("Deseja Sair ? "),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                exit(0);
                              },
                              child: const Text("Sim")),
                          ElevatedButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              child: const Text("Não")),
                        ],
                      ));
            }),
      ],
    );
  }
}
