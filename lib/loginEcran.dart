// login_ecran.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEcran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (snapshot.hasData)
                _buildUserInfo(snapshot.data!)
              else
                _buildSignInForm(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: [
        Text('Email: ${user.email ?? "N/A"}'),
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
          child: Text('Se déconnecter'),
        ),
      ],
    );
  }

  Widget _buildSignInForm() {
    // Ajoutez ici votre formulaire de connexion
    return Column(
      children: [
        Text('Connectez-vous'),
        ElevatedButton(
          onPressed: () async {
            // Ajoutez le code pour gérer la connexion de l'utilisateur ici.
          },
          child: Text('Connexion'),
        ),
      ],
    );
  }
}
