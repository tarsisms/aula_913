import 'package:aula_913/data/bd.dart';
import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:aula_913/pages/propaganda_page.dart';
import 'package:aula_913/widget/pacote_turistico_card.dart';
import 'package:flutter/material.dart';

class GridPacotesPage extends StatefulWidget {
  const GridPacotesPage({Key? key}) : super(key: key);

  @override
  _GridPacotesPageState createState() => _GridPacotesPageState();
}

class _GridPacotesPageState extends State<GridPacotesPage> {
  List<PacoteTuristico> lista = BD.lista;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.38
          ),
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int index) {
            return CardPacoteTuristico(pacoteTuristico: lista[index]);
          },
        ),
      ),
    );
  }
}
