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
    required this.cidade,
    required this.desconto,
    required this.urlImage,
    required this.titulo,
    required this.descricao,
    required this.numDiarias,
    required this.numPessoas,
    required this.valorAntigo,
    required this.valorAtual,
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
}
