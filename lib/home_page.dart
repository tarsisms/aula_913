import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildContainer(
            urlImage:
                'https://afar.brightspotcdn.com/dims4/default/5e0f8f5/2147483647/strip/true/crop/5760x3056+0+0/resize/1440x764!/quality/90/?url=https%3A%2F%2Fk3-prod-afar-media.s3.us-west-2.amazonaws.com%2Fbrightspot%2F0e%2Fe0%2F2d5cbb2139b753c565850eda5611%2Foriginal-amsterdam-the-netherlands-canals-copy.jpg',
            local: 'Harligen, Netherlands',
            host: '18-23 Dec',
            dates: 'Professional Host',
            total: '\$1,065 total',
          ),
          buildContainer(
            urlImage:
                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/28/d5/c9/natural-pools-4-km-from.jpg',
            local: 'Maragogi, Brazil',
            host: 'Professional Host',
            dates: '10-23 Dec',
            total: '\$2,065 total',
          ),
        ],
      ),
    );
  }

  buildContainer({
    required String urlImage,
    required String local,
    required String host,
    required String dates,
    required String total,
  }) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              ClipRRect(
                child: Image.network(urlImage, height: 220, fit: BoxFit.cover),
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
              Text(local, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
            ],
          ),
          buildText(host),
          buildText(dates),
          buildText(total),
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }
}
