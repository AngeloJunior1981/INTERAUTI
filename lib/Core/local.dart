import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:tea/models/usuario.dart';

class Local {
  Future<File> getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  Future<Usuario> getUser() async => await loadFile()!.then((dados) {
      Usuario usuario = Usuario.fromJson(jsonDecode(dados));
      return usuario;
    });

  save(Usuario usuario) async {
    var arquivo = await getFile();
    String dados = jsonEncode(usuario.toMap());
    arquivo.writeAsString(dados);
  }
 
  deleteFile() async{
   try {
     final file = loadFile();
     await file.delete(); 
   } catch (e) {
     return 0;
   }
 }
  loadFile() async {
    try {
      final arquivo = await getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }
}
