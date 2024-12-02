import 'package:aula_913/bd/pacote_dao.dart';
import 'package:aula_913/bd/shared_prefs.dart';
import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:aula_913/pages/login.dart';
import 'package:aula_913/widgets/card_pacote_turistico.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PacoteTuristico> pacotes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    pacotes = await PacoteDao().listarPacotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF10397B),
        actions: [
          IconButton(
            onPressed: () {
              SharedPrefs().setUser(false);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          'Pesquisar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          buildContainerPropaganda(),

          // For (int i = 0; i < Database.pacotes.length; i++) {}
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: pacotes.length,
            itemBuilder: (context, i) {
              return CardPacoteTuristico(
                pacoteTuristico: pacotes[i],
              );
            },
          ),
        ],
      ),
    );
  }

  buildContainerPropaganda() {
    return Container(
      margin: const EdgeInsets.all(16),
      color: const Color(0xFFAD00D5), // Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Top destinos mais buscados',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Corre que tá rolando muita promoção',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'EU QUERO!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Image.network(
            'https://img.freepik.com/fotos-gratis/casal-multirracial-com-bola-posando-na-praia_23-2148137988.jpg',
            height: 180,
          ),
        ],
      ),
    );
  }
}
