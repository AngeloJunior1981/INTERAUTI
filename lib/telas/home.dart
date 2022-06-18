// ignore_for_file: library_private_types_in_public_api, file_names, unused_field, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, unused_import

import 'package:flutter/material.dart';
import 'package:tea/config/Global.dart';
import 'package:tea/models/usuario.dart';
import 'package:tea/telas/alimentacao.dart';
import 'package:tea/telas/cadastroResp.dart';

import 'package:tea/telas/casa.dart';
import 'package:tea/telas/escola.dart';
import 'package:tea/telas/hospital.dart';
import 'package:tea/telas/sentimento.dart';

import 'package:tea/telas/transporte.dart';
import 'package:tea/widgets/AppBarCustomizado.dart';

import '../Core/local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _pageController = PageController();
  late Future<Usuario> usuario;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    usuario = Local().getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goTo(Widget tela) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => tela));
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 20,
        color: Color(0xffffffff));
    return Scaffold(
      appBar: AppBarCustomizado(usuario),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.15,
                    primary: false,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          goTo(Casa(usuario));
                        },
                        child: Card(
                          color: Color.fromRGBO(255, 127, 80, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                size: 50.0,
                                color: Color(0xffffffff),
                              ),
                              Text(
                                'Casa',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goTo(Transporte(usuario));
                        },
                        child: Card(
                          color: Color(0xff0d48a1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.train,
                                size: 50.0,
                                color: Color(0xffffffff),
                              ),
                              Text(
                                'Transporte',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goTo(Escola(usuario));
                        },
                        child: Card(
                          color: Color(0xff9933ff),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.school,
                                size: 50.0,
                                color: Color(0xffffffff),
                              ),
                              Text(
                                'Escola',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goTo(Sentimento(usuario));
                        },
                        child: Card(
                          color: Color(0xffc3ad40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.sentiment_satisfied_alt,
                                size: 50.0,
                                color: Color(0xffffffff),
                              ),
                              Text(
                                'Sentimento',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goTo(Alimentacao(usuario));
                        },
                        child: Card(
                          color: Color(0xff8cc340),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.food_bank,
                                size: 50.0,
                                color: Color(0xffffffff),
                              ),
                              Text(
                                'Alimentação',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goTo(Hospital(usuario));
                        },
                        child: Card(
                          color: Color(0xffc62828),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.local_hospital,
                                size: 50.0,
                                color: Color(0xffffffff),
                              ),
                              Text(
                                'Hospital',
                                style: cardTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    goTo(CadastroResponsavel(usuario));
                  },
                  child: Icon(Icons.edit),
                )
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
