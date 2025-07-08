import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPropriedade extends StatefulWidget {
  String urlImage;
  String local;
  double avaliacao;
  String tipoHost;
  String datas;
  String valor;

  CardPropriedade({
    required this.urlImage,
    required this.local,
    required this.avaliacao,
    required this.tipoHost,
    required this.datas,
    required this.valor,
    super.key,
  });

  @override
  State<CardPropriedade> createState() => _CardPropriedadeState();
}

class _CardPropriedadeState extends State<CardPropriedade> {
  String get urlImage => widget.urlImage;

  // String getUrlImage {
  //   return widget.urlImage;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(urlImage),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              buildText(
                text: widget.local,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              Icon(Icons.star, size: 16),
              buildText(
                text: '4.76',
                fontSize: 16.0,
                color: Colors.black,
              ),
            ],
          ),
          buildText(text: widget.tipoHost),
          buildText(text: widget.datas),
          buildText(
            text: '\$${widget.valor} total',
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  buildText({required text, color, fontSize, fontWeight}) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
