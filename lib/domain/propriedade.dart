class Propriedade {
  late int id;
  late String urlImagem;
  late String local;
  late String host;
  late String dates;
  late String total;

  Propriedade({
    required this.urlImagem,
    required this.local,
    required this.host,
    required this.dates,
    required this.total,
  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    // avaliacao = json['avaliacao'];
    id = json['id'];
    total = (json['total']).toString();
    dates = json['dates'];
    local = json['local'];
    host = json['host'];
    urlImagem = json['urlImagem'];
  }
}
