import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:aula_913/pages/detail_page.dart';
import 'package:flutter/material.dart';

class CardPacoteTuristico extends StatefulWidget {
  final PacoteTuristico pacoteTuristico;

  const CardPacoteTuristico({
    super.key,
    required this.pacoteTuristico,
  });

  @override
  State<CardPacoteTuristico> createState() => _CardPacoteTuristicoState();
}

class _CardPacoteTuristicoState extends State<CardPacoteTuristico> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.pacoteTuristico.urlImage),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pacoteTuristico.titulo,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.pacoteTuristico.descricao),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.wb_sunny_outlined, size: 20),
                        const SizedBox(width: 4),
                        Text('${widget.pacoteTuristico.numDiarias} Diária(s)'),
                        const SizedBox(width: 8),
                        const Icon(Icons.person, size: 20),
                        const SizedBox(width: 4),
                        Text('${widget.pacoteTuristico.numPessoas} Pessoa(s)'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                        'A partir de R\$ ${widget.pacoteTuristico.valorAntigo}'),
                    Text(
                      'R\$ ${widget.pacoteTuristico.valorAtual}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFD6C00),
                      ),
                    ),
                    const Text(
                      'Cancelamento Grátis',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                pacoteTuristico: widget.pacoteTuristico,
              );
            },
          ),
        );
      },
    );
  }
}
