import 'package:aula_913/api/address_api.dart';
import 'package:aula_913/bd/user_dao.dart';
import 'package:aula_913/domain/address.dart';
import 'package:aula_913/domain/user.dart';
import 'package:aula_913/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  TextEditingController cepController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Registrar usuario',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF10397B),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    validator: (value) {
                      if (value!.contains("@")) {
                        return null;
                      } else {
                        return "Você precisa digitar um e-mail válido!";
                      }
                    },
                    decoration: buildInputDecoration('E-mail'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    controller: senhaController,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length >= 6) {
                        return null;
                      } else {
                        return "Você precisa digitar uma senha válida!";
                      }
                    },
                    decoration: buildInputDecoration('Senha'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      String senha = senhaController.text;
                      if (value!.length >= 6) {
                        return null;
                      } else if (senha != value) {
                        return "As senhas precisam ser iguais!";
                      } else {
                        return "Você precisa digitar uma senha válida!";
                      }
                    },
                    decoration: buildInputDecoration('Confirmar Senha'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: cepController,
                    decoration: buildInputDecoration(
                      'CEP',
                      suffixIcon: IconButton(
                        onPressed: onPressedIconButton,
                        icon: Icon(Icons.search),
                      ),
                    ),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: enderecoController,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Você precisa digitar um endereço válido!";
                      }
                    },
                    decoration: buildInputDecoration('Endereço'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 32),
                  // Spacer(),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE81F7C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Cadastrar',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  onPressedIconButton() async {
    String cep = cepController.text;
    try {
      Address address = await AddressApi().findAddressByCep(cep);
      enderecoController.text = address.address;
    } catch (e) {
      showSnackBar('Ocorreu um erro inesperado!');
    }
  }

  showSnackBar(String snackBarMessage) {
    SnackBar snackBar = SnackBar(
      content: Text(snackBarMessage),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  buildInputDecoration(String name, {Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFF10397B),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFF10397B),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    // Validar o Form
    if (formKey.currentState!.validate()) {
      // Verificar e-mail e senha
      String email = emailController.text;
      String senha = senhaController.text;

      User user = User(email, senha);
      await UserDao().saveUser(user);
      Navigator.pop(context);
    }
  }
}
