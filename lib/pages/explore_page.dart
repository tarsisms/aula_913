import 'package:aula_913/api/propriedades_api.dart';
import 'package:aula_913/domain/Propriedade.dart';
import 'package:aula_913/widget/container_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // List<Propriedade> listaPropriedades = [];
  late Future<List<Propriedade>> futureListaPropriedades;

  @override
  void initState() {
    super.initState();
    // futureListaPropriedades = PropriedadeDao().listarPropriedades();
    futureListaPropriedades = PropriedadesApi().listarPropriedades();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureListaPropriedades,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Propriedade> listaPropriedades = snapshot.requireData;
            return buildListView(listaPropriedades);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildListView(listaPropriedades) {
    return ListView.builder(
      // Num de repeticoes
      itemCount: listaPropriedades.length,
      // Children
      itemBuilder: (context, i) {
        return ContainerPropriedade(propriedade: listaPropriedades[i]);
      },
    );
  }
}
