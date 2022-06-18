class Usuario {
  final String nomeResp;
  final String telefoneResp;
  final String nome;
  final String idade;
  final String sexo;
  final String telefone;
  final String cidadeNasc;
  final String nomeMae;
  final String nomePai;
  final String ativGosta;
  final String ativNGosta;

  Usuario(
      this.nomeResp,
      this.telefoneResp,
      this.nome,
      this.idade,
      this.sexo,
      this.telefone,
      this.cidadeNasc,
      this.nomeMae,
      this.nomePai,
      this.ativGosta,
      this.ativNGosta);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nomeResp": nomeResp,
      "telefoneResp": telefoneResp,
      "nome": nome,
      "idade": idade,
      "sexo": sexo,
      "telefone": telefone,
      "cidadeNasc": cidadeNasc,
      "nomeMae": nomeMae,
      "nomePai": nomePai,
      "ativGosta": ativGosta,
      "ativNGosta": ativNGosta
    };
    return map;
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : nomeResp = json['nomeResp'],
        telefoneResp = json['telefoneResp'],
        nome = json['nome'],
        idade = json['idade'],
        sexo =  json['sexo'],
        telefone = json['telefone'],
        cidadeNasc = json['cidadeNasc'],
        nomeMae = json['nomeMae'],
        nomePai = json['nomePai'],
        ativGosta = json['ativGosta'],
        ativNGosta = json['ativNGosta'];
}
