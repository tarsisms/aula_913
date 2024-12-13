import 'package:aula_913/bd/pacote_dao.dart';
import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPackage extends StatefulWidget {
  const RegisterPackage({super.key});

  @override
  State<RegisterPackage> createState() => _RegisterPackageState();
}

class _RegisterPackageState extends State<RegisterPackage> {
  TextEditingController urlImageController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController tituloAnoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController validadeController = TextEditingController();
  TextEditingController descontoController = TextEditingController();
  TextEditingController numDiariasController = TextEditingController();
  TextEditingController numPessoasController = TextEditingController();
  TextEditingController valorAtualController = TextEditingController();
  TextEditingController valorAntigoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          buildTextFormField(
            controller: urlImageController,
            text: 'Url da Imagem',
          ),
          buildTextFormField(
            controller: cidadeController,
            text: 'Nome da Cidade',
          ),
          buildTextFormField(
            controller: tituloController,
            text: 'Titulo',
          ),
          buildTextFormField(
            controller: tituloAnoController,
            text: 'Titulo c/ Ano',
          ),
          buildTextFormField(
            controller: descricaoController,
            text: 'Descrição',
          ),
          buildTextFormField(
            controller: validadeController,
            text: 'Data de Validade',
          ),
          buildTextFormField(
            controller: descontoController,
            text: 'Valor do Desconto',
          ),
          buildTextFormField(
            controller: numDiariasController,
            text: 'Número de diárias',
          ),
          buildTextFormField(
            controller: numPessoasController,
            text: 'Número de pessoas',
          ),
          buildTextFormField(
            controller: valorAtualController,
            text: 'Valor Atual',
          ),
          buildTextFormField(
            controller: valorAntigoController,
            text: 'Valor Antigo',
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F68F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Cadastrar Pacote',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildTextFormField({
    required TextEditingController controller,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: fieldValidator,
        decoration: buildInputDecoration(text),
        cursorColor: const Color(0xFF10397B),
      ),
    );
  }

  String? fieldValidator(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio!";
    } else {
      return null;
    }
  }

  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFF10397B),
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: const Text(
        'Novo Pacote Turistico',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  buildInputDecoration(String name) {
    return InputDecoration(
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
    String urlImage = urlImageController.text;
    String cidade = cidadeController.text;
    String titulo = tituloController.text;
    String tituloAno = tituloAnoController.text;
    String descricao = descricaoController.text;
    String validade = validadeController.text;
    int desconto = int.parse(descontoController.text);
    int numDiarias = int.parse(numDiariasController.text);
    int numPessoas = int.parse(numPessoasController.text);
    double valorAtual = double.parse(valorAtualController.text);
    double valorAntigo = double.parse(valorAntigoController.text);

    PacoteTuristico pacote = PacoteTuristico(
      id: 0,
      urlImage: urlImage,
      cidade: cidade,
      titulo: titulo,
      tituloAno: tituloAno,
      descricao: descricao,
      validade: validade,
      desconto: desconto,
      numDiarias: numDiarias,
      numPessoas: numPessoas,
      valorAtual: valorAtual,
      valorAntigo: valorAntigo,
    );

    await PacoteDao().salvarPacote(pacote);
    Navigator.pop(context);
  }
}
