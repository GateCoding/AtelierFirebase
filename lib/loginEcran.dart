import 'package:atelier4pelamriiir5g7/liste_produits.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEcran extends StatelessWidget {
  const LoginEcran({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SignInScreen();
        }

        return ListeProduits();

        // User? user = snapshot.data;

        // return Container(
        //   alignment: Alignment.center,
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Text(
        //         'Email: ${user?.email ?? "Non connecté"}',
        //         style: const TextStyle(fontSize: 16.0),
        //       ),
        //       const SizedBox(height: 16.0),
        //       ElevatedButton(
        //         onPressed: () async {
        //           await FirebaseAuth.instance.signOut();
        //         },
        //         child: const Text('Se déconnecter'),
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }
}
