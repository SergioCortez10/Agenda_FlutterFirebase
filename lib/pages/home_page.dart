import 'package:flutter/material.dart';

import 'package:agenda_firabase/services/firebase_services.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: FutureBuilder(
          future: getNotas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  // return Text(snapshot.data?[index]['descripcion']);
                  return ListTile(
                      title: Text(snapshot.data?[index]['descripcion']),
                      subtitle: Text(snapshot.data?[index]['fecha']),
                      leading: CircleAvatar(
                        child: Text(snapshot.data?[index]['descripcion']
                            .substring(0, 1)),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[200],
                        ),
                        onPressed: () {
                          _eliminarNota(context, snapshot.data?[index]);
                        },
                      ));
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/new');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _eliminarNota(BuildContext context, nota) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Seguro que quieres eliminar esta nota'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              deleteNota(nota);
              Navigator.pop(context);
            },
            child: const Text('Si'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}
