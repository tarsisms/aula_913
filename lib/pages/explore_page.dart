import 'package:aula_913/db/database.dart';
import 'package:aula_913/widgets/card_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      // FOR
      child: ListView.builder(
        // children: [
        // for(int i = 0; i < propriedades.length; i++) {
        //   CardPropriedade(
        //     propriedade: propriedades[i],
        //   )
        // }
        itemCount: Database.propriedades.length,
        itemBuilder: (context, i) {
          return CardPropriedade(
            propriedade: Database.propriedades[i],
          );
        },

        // ],
      ),
    );
  }
}
