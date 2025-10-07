class Address {
  late String cep;
  late String state;
  late String city;
  late String neighborhood;
  late String street;
  late String service;

  Address({
    required this.cep,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.service,
  });

  String get completeAddress => '$street, $neighborhood, $city - $state';

  Address.fromJson(Map<String, dynamic> json) {
    // json['cep'] ?? ''
    // OU
    // if(json['cep'] != null){
    //   cep = json['cep'];
    // } else {
    //   cep = '';
    // }

    cep = json['cep'] ?? '';
    state = json['state'] ?? '';
    city = json['city'] ?? '';
    street = json['street'] ?? '';
    service = json['service'] ?? '';
    neighborhood = json['neighborhood'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['state'] = this.state;
    data['city'] = this.city;
    data['neighborhood'] = this.neighborhood;
    data['street'] = this.street;
    data['service'] = this.service;

    return data;
  }
}
