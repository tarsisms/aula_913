import 'package:aula_913/domain/Propriedade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPage extends StatefulWidget {
  Propriedade propriedade;
  LatLng location;
  Set<Marker> markers;

  DetailPage({super.key, required this.propriedade, required this.location, required this.markers});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Metodo Get
  Propriedade get propriedade => widget.propriedade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              // Image.network(propriedade.urlImagem),
              Container(
                height: 400,
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: widget.markers,
                  initialCameraPosition: CameraPosition(target: widget.location, zoom: 14),
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            children: [
              Text(
                propriedade.local,
                style: GoogleFonts.inter(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Apartamento na Holanda',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
              ),
              Text(
                '2 camas e banheiro privativo',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
