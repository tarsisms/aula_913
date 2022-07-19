import 'package:aula_913/data/bd.dart';
import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:aula_913/pages/propaganda_page.dart';
import 'package:aula_913/widget/pacote_turistico_card.dart';
import 'package:flutter/material.dart';

class DestaquesPage extends StatefulWidget {
  const DestaquesPage({Key? key}) : super(key: key);

  @override
  _DestaquesPageState createState() => _DestaquesPageState();
}

class _DestaquesPageState extends State<DestaquesPage> {
  // buildContainerPropaganda(context),
  // const SizedBox(height: 16),
  Future<List<PacoteTuristico>> lista = BD.getPacotesTuristicos();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          buildContainerPropaganda(context),
          const SizedBox(height: 16),
          buildListView()
        ],
      ),
    );
  }

  buildListView() {
    return FutureBuilder<List<PacoteTuristico>>(
      future: lista,
      builder: (context, snapshot) {

        if(snapshot.hasData) {
          // ?? -> Verificar ser o conteudo de snapshot.data é nulo
          List<PacoteTuristico> lista = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lista.length,
            itemBuilder: (BuildContext context, int index) {
              return CardPacoteTuristico(pacoteTuristico: lista[index]);
            },
          );
        }

        return Center(child: const CircularProgressIndicator());

      },
    );




  }

  buildContainerPropaganda(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'TOP DESTINOS MAIS BUSCADOS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Corre que ta rolando muita promoção',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PropagandaPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Eu quero',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Color(0xFFF8FF04)),
                )
              ],
            ),
          ),
          const SizedBox(width: 24),
          const Placeholder(
            fallbackHeight: 150,
            fallbackWidth: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
