import 'package:aula_913/api/address_api.dart';
import 'package:aula_913/db/user_dao.dart';
import 'package:aula_913/domain/Address.dart';
import 'package:aula_913/domain/user.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastre-se no Airbnb',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  focusedBorder: buildFirstItemOutlineInputBorder(),
                  border: buildFirstItemOutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  focusedBorder: buildSecondItemOutlineInputBorder(),
                  border: buildSecondItemOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: cepController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: onPressedFindByCep, icon: Icon(Icons.search)),
                  hintText: 'Cep',
                  focusedBorder: buildFirstItemOutlineInputBorder(),
                  border: buildFirstItemOutlineInputBorder(),
                ),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Endereco',
                  focusedBorder: buildSecondItemOutlineInputBorder(),
                  border: buildSecondItemOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE41D56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildSecondItemOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(8),
      ),
    );
  }

  OutlineInputBorder buildFirstItemOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8),
      ),
    );
  }

  Future<void> onPressed() async {
    String username = userController.text;
    String password = passwordController.text;

    User user = User(username, password);
    await UserDao().save(user);
    Navigator.pop(context);
  }

  Future<void> onPressedFindByCep() async {
    String cep = cepController.text;
    Address address = await AddressApi().findByCep(cep);
    addressController.text = address.completeAddress;
  }
}
