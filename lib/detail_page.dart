import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            'https://www.viagenscinematograficas.com.br/wp-content/uploads/2019/03/Cancun-Melhores-Praias-Riviera-Maya-Capa.jpg',
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CANCÚN, MEX',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pacote Cancún - Segundo Semestre 2025',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                buildText('Aereo + Hotel All Inclusive'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.wb_sunny_outlined, size: 20),
                    const SizedBox(width: 4),
                    buildText('5 ou 7 diárias'),
                    const Spacer(),
                    Container(
                      color: const Color(0xFFFD6C00),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Text(
                          '-45%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
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
                    buildText('A partir de R\$ 6816'),
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
                      'R\$ 3.749',
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
