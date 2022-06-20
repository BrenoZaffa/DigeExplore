import 'package:digeexplore/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PageNome extends StatefulWidget {
  const PageNome({Key? key}) : super(key: key);

  @override
  State<PageNome> createState() => _PageNomeState();
}

class _PageNomeState extends State<PageNome> {
  final buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 18),
    padding: const EdgeInsets.all(18),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    shadowColor: Colors.black,
    primary: Colors.green,
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final nomeUser = context.watch<UserRepository>();
    final nome = TextEditingController(text: nomeUser.nome);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff073B4C),
        title: const Text('DigeExplore'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Informe seu nome!",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Form(
                key: form,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  controller: nome,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Preencha o nome';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        nomeUser.setNome(nome.text);
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    icon: Icon(Icons.check),
                    label: Text('Salvar'),
                    style: buttonStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
