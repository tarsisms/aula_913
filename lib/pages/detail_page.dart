import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final PacoteTuristico pacoteTuristico;

  const DetailPage({super.key, required this.pacoteTuristico});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PacoteTuristico get pacote => widget.pacoteTuristico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              // widget.pacoteTuristico.urlImage,
              pacote.urlImage),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pacote.cidade,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pacote.titulo,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                buildText(pacote.descricao),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.wb_sunny_outlined, size: 20),
                    const SizedBox(width: 4),
                    buildText('${pacote.numDiarias} diária(s)'),
                    const Spacer(),
                    Container(
                      color: const Color(0xFFFD6C00),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Text(
                          '-${pacote.desconto}%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText('Válido por um período de:'),
                    buildText('A partir de R\$ ${pacote.valorAntigo}'),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'De 01 jan. 2025\na 31 dez. 2025',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'R\$ ${pacote.valorAtual}',
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFD6C00),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'O que está incluso',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Cancelamento Grátis!',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.check, size: 35),
                        const SizedBox(height: 16),
                        buildText('Apartamento'),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.room_service, size: 35),
                        const SizedBox(height: 16),
                        buildText('All Inclusive'),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.flight, size: 35),
                        const SizedBox(height: 16),
                        buildText('Passagem Aérea'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 14,
      ),
    );
  }
}
