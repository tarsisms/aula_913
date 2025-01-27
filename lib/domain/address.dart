class Address {
  late String cep;
  late String state;
  late String city;
  late String neighborhood;
  late String street;

  Address({
    required this.cep,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.street,
  });

  String get address => '$street, $neighborhood, $city - $state';

  Address.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    state = json['state'];
    city = json['city'];
    neighborhood = json['neighborhood'] ?? '';
    street = json['street'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['state'] = state;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    data['street'] = street;

    return data;
  }
}
