class PacoteTuristico {
  late int id;
  late String urlImage;
  late String cidade;
  late String titulo;
  late String tituloAno;
  late String descricao;
  late String validade;
  late int desconto;
  late int numDiarias;
  late int numPessoas;
  late double valorAtual;
  late double valorAntigo;

  PacoteTuristico({
    required this.id,
    required this.urlImage,
    required this.cidade,
    required this.titulo,
    required this.tituloAno,
    required this.descricao,
    required this.validade,
    required this.desconto,
    required this.numDiarias,
    required this.numPessoas,
    required this.valorAtual,
    required this.valorAntigo,
  });

  PacoteTuristico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    tituloAno = json['titulo_ano'];
    urlImage = json['url_image'];
    cidade = json['cidade'];
    descricao = json['descricao'];
    validade = json['validade'];
    desconto = json['desconto'];
    numDiarias = json['num_diarias'];
    numPessoas = json['num_pessoas'];
    valorAntigo = json['valor_antigo'];
    valorAtual = json['valor_atual'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['titulo'] = titulo;
    json['titulo_ano'] = tituloAno;
    json['url_image'] = urlImage;
    json['cidade'] = cidade;
    json['descricao'] = descricao;
    json['validade'] = validade;
    json['desconto'] = desconto;
    json['num_diarias'] = numDiarias;
    json['num_pessoas'] = numPessoas;
    json['valor_antigo'] = valorAntigo;
    json['valor_atual'] = valorAtual;

    return json;
  }
}
