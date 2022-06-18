import 'package:tea/models/usuario.dart';


validaDados(Usuario usuario) {
  if (usuario.nome.isEmpty) {
    return "Informe o nome";
  }
  if (usuario.idade.isEmpty) {
    return "Informe a idade";
  }
  if (usuario.telefone.isEmpty) {
    return "Informe o telefone";
  }
  if (usuario.nomeMae.isEmpty) {
    return "Informe o nome da Mãe";
  }
  if (usuario.nomePai.isEmpty) {
    return "Informe o nome do Pai";
  }
  if (usuario.cidadeNasc.isEmpty) {
    return "Informe a cidade que nasceu";
  }
  if (usuario.ativGosta.isEmpty) {
    return "Informe a Atividade que gosta";
  }
  if (usuario.ativNGosta.isEmpty) {
    return "Informe a Atividade que nao gosta";
  }
  return null;
}
