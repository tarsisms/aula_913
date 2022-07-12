import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:flutter/material.dart';


class PacoteDetalhes extends StatefulWidget {
  final PacoteTuristico pacoteTuristico;

  const PacoteDetalhes({
    Key? key,
    required this.pacoteTuristico,
  }) : super(key: key);

  @override
  _PacoteDetalhesState createState() => _PacoteDetalhesState();
}

class _PacoteDetalhesState extends State<PacoteDetalhes> {
  PacoteTuristico get pacote => widget.pacoteTuristico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(pacote.imagem),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pacote.cidade,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                buildText(
                  text: pacote.titulo,
                  fontSize: 21,
                  isBold: true,
                ),
                const SizedBox(height: 8),
                buildText(text: pacote.transporte),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText(
                      text: '${pacote.numDiarias} diárias',
                      fontSize: 16,
                    ),
                    Container(
                      color: const Color(0xFFFD6C00),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      child: Text(
                        '-${pacote.desconto}%',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText(
                      text: 'Válido para o periodo de:',
                    ),
                    buildText(
                      text: 'A partir de ${pacote.precoAntigo}',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText(
                      text: pacote.validade,
                    ),
                    buildText(
                      text: '${pacote.precoAtual}',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildText({
    required String text,
    double fontSize = 16,
    bool isBold = false,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: isBold ? FontWeight.w600 : null,
      ),
    );
  }
}
