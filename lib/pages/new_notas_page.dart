import 'package:flutter/material.dart';

import 'package:agenda_firabase/services/firebase_services.dart';

class NewNotasPage extends StatefulWidget {
  const NewNotasPage({super.key});

  @override
  State<NewNotasPage> createState() => _NewNotasPageState();
}

class _NewNotasPageState extends State<NewNotasPage> {
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController fechaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Nota'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: descripcionController,
                decoration: const InputDecoration(
                  hintText: 'Descripción..',
                ),
              ),
              TextField(
                controller: fechaController,
                decoration: const InputDecoration(
                  hintText: 'Fecha dd/mm/aa',
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await newNota(
                            descripcionController.text, fechaController.text)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Guardar')),
            ],
          ),
        ));
  }
}
