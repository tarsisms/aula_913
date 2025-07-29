class Propriedade {
  late String urlImage;
  late String local;
  late double avaliacao;
  late String tipoHost;
  late String datas;
  late double valor;

  Propriedade({
    required this.urlImage,
    required this.local,
    required this.avaliacao,
    required this.tipoHost,
    required this.datas,
    required this.valor,
  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    valor = json['valor'];
    avaliacao = json['avaliacao'];
    datas = json['datas'];
    local = json['local'];
    tipoHost = json['tipoDeHost'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valor'] = this.valor;
    data['avaliacao'] = this.avaliacao;
    data['datas'] = this.datas;
    data['local'] = this.local;
    data['tipoDeHost'] = this.tipoHost;
    data['urlImage'] = this.urlImage;
    return data;
  }
}
