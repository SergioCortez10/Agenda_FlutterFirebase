import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getNotas() async {
  List notas = [];
  CollectionReference collectionReferenceNotas = db.collection('notas');

  QuerySnapshot queryNotas = await collectionReferenceNotas.get();

  queryNotas.docs.forEach((documento) {
    print(documento.data());
    notas.add(documento.data());
  });

  return notas;
}

Future<void> newNota(String descripcion, String fecha) async {
  await db
      .collection('notas')
      .add({"descripcion": descripcion, "fecha": fecha});
}

Future<void> deleteNota(String nota) async {
  await db.collection("notas").doc(nota).delete();
}
