class PacoteTuristico {
  String urlImage;
  String cidade;
  String titulo;
  String descricao;
  int desconto;
  int numDiarias;
  int numPessoas;
  double valorAtual;
  double valorAntigo;

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
}
