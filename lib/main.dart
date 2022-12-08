import 'package:flutter/material.dart';

// importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Paginas
import 'package:agenda_firabase/pages/home_page.dart';
import 'package:agenda_firabase/pages/new_notas_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/new': (context) => const NewNotasPage(),
      },
    );
  }
}
