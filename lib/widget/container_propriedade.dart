import 'package:aula_913/domain/Propriedade.dart';
import 'package:aula_913/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContainerPropriedade extends StatefulWidget {
  Propriedade propriedade;

  ContainerPropriedade({super.key, required this.propriedade});

  @override
  State<ContainerPropriedade> createState() => _ContainerPropriedadeState();
}

class _ContainerPropriedadeState extends State<ContainerPropriedade> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Geocoding geocoding = Geocoding();
        List<Location> locations = await geocoding.locationFromAddress(widget.propriedade.local);
        LatLng location = LatLng(locations[0].latitude, locations[0].longitude);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(propriedade: widget.propriedade, location: location);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                ClipRRect(
                  child: Image.network(
                    widget.propriedade.urlImagem,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                Positioned(
                  child: Icon(Icons.favorite, size: 36, color: Color(0xFFE41D56)),
                  top: 16,
                  right: 16,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.propriedade.local,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
              ],
            ),
            buildText(widget.propriedade.host),
            buildText(widget.propriedade.dates),
            buildText(widget.propriedade.total),
          ],
        ),
      ),
    );
  }

  onTapContainer() {}

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }
}
