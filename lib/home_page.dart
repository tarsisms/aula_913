import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF10397B),
        title: Text(
          'Pesquisar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            color: Color(0xFFAD00D5), // Colors.deepPurple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 8),
                Column(
                  children: [
                    Text(
                      'Top destinos mais buscados',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Corre que tá rolando muita promoção',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'EU QUERO!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Image.network(
                  'https://img.freepik.com/fotos-gratis/casal-multirracial-com-bola-posando-na-praia_23-2148137988.jpg',
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
