import 'package:aula_913/bd/shared_prefs.dart';
import 'package:aula_913/pages/home_page.dart';
import 'package:aula_913/pages/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    bool isAuth = await SharedPrefs().getUser();
    await Future.delayed(const Duration(seconds: 3));

    if (isAuth) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF233E7D),
      child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Logo-hurb-branca-bg-azul.jpg/440px-Logo-hurb-branca-bg-azul.jpg'),
    );
  }
}
