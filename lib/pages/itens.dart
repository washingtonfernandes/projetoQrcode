import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Itens extends StatefulWidget {
  const Itens({Key? key}) : super(key: key);

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends State<Itens> {
  List lista = GetStorage().read('lista');
  final TextEditingController controller = TextEditingController();

  removerItem(int index) {
    if (index >= 0 && index < lista.length) {
      lista.removeAt(index);
      GetStorage().write('nome_da_lista', lista);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista dos Itens',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 148, 49, 186),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lista[index] ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 251, 251, 251),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            removerItem(index);

                            setState(() {
                              lista = lista;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 207, 108, 222),
                          ),
                          child: const Text(
                            'Apagar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
