import 'package:aula_913/api/address_api.dart';
import 'package:aula_913/db/shared_prefs.dart';
import 'package:aula_913/pages/explore_page.dart';
import 'package:aula_913/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPrefs prefs = SharedPrefs();
  int selectedIndex = 0;
  List pages = [
    ExplorePage(),
    Center(child: Text('Pagina 1', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 2', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 3', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 4', style: TextStyle(fontSize: 32))),
  ];

  @override
  Widget build(BuildContext context) {
    AddressApi().findByCep('57300190');

    return Scaffold(
      appBar: AppBar(
        actions: buildActions(),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisar',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  buildActions() {
    return [
      IconButton(
        onPressed: () {
          prefs.setUserStatus(false);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          );
        },
        icon: Icon(Icons.logout),
      ),
    ];
  }

  buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFFE41D56),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Whishlist'),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.airbnb), label: 'Trips'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
