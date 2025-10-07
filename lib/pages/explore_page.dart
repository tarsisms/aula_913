import 'package:aula_913/api/propriedades_api.dart';
import 'package:aula_913/domain/propriedade.dart';
import 'package:aula_913/widgets/card_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // List listaPropriedades = [];
  late Future<List<Propriedade>> futurelistaPropriedades;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    futurelistaPropriedades = PropriedadesApi().findAll();
    // futurelistaPropriedades = PropriedadesDao().listarPropriedades();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      // FOR
      child: FutureBuilder<List<Propriedade>>(
        future: futurelistaPropriedades,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Propriedade> lista = snapshot.requireData;
            return buildListView(lista);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildListView(List<Propriedade> listaPropriedades) {
    return ListView.builder(
      // children: [
      // for(int i = 0; i < propriedades.length; i++) {
      //   CardPropriedade(
      //     propriedade: propriedades[i],
      //   )
      // }
      itemCount: listaPropriedades.length,
      itemBuilder: (context, i) {
        return CardPropriedade(
          propriedade: listaPropriedades[i],
        );
      },

      // ],
    );
  }
}
