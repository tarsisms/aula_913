import 'package:aula_913/api/user_api.dart';
import 'package:aula_913/db/shared_prefs.dart';
import 'package:aula_913/domain/user.dart';
import 'package:aula_913/pages/explore_page.dart';
import 'package:aula_913/pages/login_page.dart';
import 'package:aula_913/pages/profile_page.dart';
import 'package:aula_913/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  var pages = [
    ExplorePage(),
    Center(child: Text('Pagina 1', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 2', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 3', style: TextStyle(fontSize: 32))),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () async {
                // context.read<ProfileProvider>() -> Acessa o ProfileProvider, mas não fica monitorando as alterações que acontecem
                // Alterar entre usuários apenas para demonstrar o funcionamento do Provider
                ProfileProvider provider = context.read<ProfileProvider>();

                // if - Opção 1
                int id = provider.user.id == 1 ? 2 : 1;

                // if - Opção 2 - Equivalente a opção 1
                // if (id == 1) {
                //   id = 2;
                // } else {
                //   id = 1;
                // }

                User user = await UserApi().findById(id);
                provider.setUser(user);
              },
              icon: Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                SharedPrefs().setUserStatus(false);
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
          ],
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xFF6C6C6C),
      selectedItemColor: Color(0xFFE41D56),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explorer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.airbnb),
          label: 'Trips',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.message),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.circleUser),
          label: 'Profile',
        ),
      ],
    );
  }
}
