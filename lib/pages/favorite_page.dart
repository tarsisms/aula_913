import 'package:aula_913/domain/Propriedade.dart';
import 'package:aula_913/provider/favorite_provider.dart';
import 'package:aula_913/widget/container_propriedade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // late Future<List<Propriedade>> futureListaPropriedades;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Propriedade> listaPropriedades = context.read<FavoriteProvider>().favoritos;

    return Scaffold(
      body: ListView.builder(
        itemCount: listaPropriedades.length,
        itemBuilder: (context, i) {
          return ContainerPropriedade(propriedade: listaPropriedades[i]);
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
