import 'package:atelier4pelamriiir5g7/firebase_options.dart';
import 'package:atelier4pelamriiir5g7/liste_produits.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'loginEcran.dart';

void main() async {
  // Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
  runApp(const MainApp());
  // }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jhhhhhhh',
      home: ListeProduits()
      //  Scaffold(
      //   appBar: AppBar(title: Text("hello")),
      // )
      ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
