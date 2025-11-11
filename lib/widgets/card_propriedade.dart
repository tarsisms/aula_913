import 'package:aula_913/domain/propriedade.dart';
import 'package:aula_913/pages/google_maps_page.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(text: widget.propriedade.tipoHost),
                  buildText(text: widget.propriedade.datas),
                  buildText(
                    text: '\$${widget.propriedade.valor} total',
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              TextButton(
                onPressed: () async {
                  List<Location> locations = await locationFromAddress(propriedade.local);
                  LatLng position = LatLng(locations[0].latitude, locations[0].longitude);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GoogleMapsPage(position: position);
                      },
                    ),
                  );
                },
                child: buildText(text: 'Ver no mapa'),
              )
            ],
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
