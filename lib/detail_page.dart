import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            'https://www.viagenscinematograficas.com.br/wp-content/uploads/2019/03/Cancun-Melhores-Praias-Riviera-Maya-Capa.jpg',
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CANCÚN, MEX',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Pacote Cancún 2025',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Aereo + Hotel All Inclusive'),
                SizedBox(height: 8),
                Text(
                  '5 ou 7 diárias',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Válido por um período de',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'A partir de R\$ 6816',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'De 01 jan. 2025 a 31 dez. 2025',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'R\$ 3749',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFD6C00)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
