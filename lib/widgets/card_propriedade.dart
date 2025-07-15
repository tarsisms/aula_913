import 'package:aula_913/domain/propriedade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPropriedade extends StatefulWidget {
  Propriedade propriedade;

  CardPropriedade({
    required this.propriedade,
    super.key,
  });

  @override
  State<CardPropriedade> createState() => _CardPropriedadeState();
}

class _CardPropriedadeState extends State<CardPropriedade> {
  // String get urlImage => widget.urlImage;
  Propriedade get propriedade => widget.propriedade;

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
            child: Image.network(propriedade.urlImage),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              buildText(
                text: propriedade.local,
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
          buildText(text: widget.propriedade.tipoHost),
          buildText(text: widget.propriedade.datas),
          buildText(
            text: '\$${widget.propriedade.valor} total',
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
