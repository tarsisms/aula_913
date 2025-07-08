import 'package:aula_913/widgets/card_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          CardPropriedade(
            urlImage:
                'https://a0.muscache.com/im/pictures/miso/Hosting-1175454379947905292/original/1873def9-5710-403f-b1f1-b2c766f61e31.jpeg?im_w=1200',
            local: 'Harlingen, Netherlands',
            avaliacao: 4.76,
            datas: '14 - 30 Dec',
            tipoHost: 'Professional Host',
            valor: '1,068',
          ),
        ],
      ),
    );
  }
}
