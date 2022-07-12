import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:aula_913/pages/pacote_detalhes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPacoteTuristico extends StatefulWidget {
  final PacoteTuristico pacoteTuristico;

  const CardPacoteTuristico({
    Key? key,
    required this.pacoteTuristico,
  }) : super(key: key);

  @override
  _CardPacoteTuristicoState createState() => _CardPacoteTuristicoState();
}

class _CardPacoteTuristicoState extends State<CardPacoteTuristico> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PacoteDetalhes(
                pacoteTuristico: widget.pacoteTuristico,
              );
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.pacoteTuristico.titulo,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(widget.pacoteTuristico.transporte),
                  const SizedBox(height: 8),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.wb_sunny_outlined),
                      const SizedBox(width: 4),
                      Text('${widget.pacoteTuristico.numDiarias} Diárias'),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.person_outline),
                          const SizedBox(width: 4),
                          Text('${widget.pacoteTuristico.numPessoas} Pessoas'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('A partir de R\$ ${widget.pacoteTuristico.precoAntigo}'),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'R\$ ${widget.pacoteTuristico.precoAtual}',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cancelamento Grátis!',
                    style: TextStyle(
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildImage() {
    return Stack(
      children: [
        SizedBox(
          height: 170,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
            child: Image.network(
              widget.pacoteTuristico.imagem,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: const Text(
            '-45%',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          decoration: const BoxDecoration(
            color: Color(0xFFfd6c00),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ],
    );
  }
}
