import 'package:atelier4pelamriiir5g7/produit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProduitItem extends StatelessWidget {
  final Produit produit;
  FirebaseFirestore db = FirebaseFirestore.instance;
  ProduitItem({required this.produit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(produit.designation),
      subtitle: Text(produit.marque),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${produit.prix}'),
          SizedBox(width: 8), // Ajoutez un espace entre le prix et le bouton
          ElevatedButton(
            onPressed: () async {
              await db.collection('produits').doc(produit.id).delete();
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}
