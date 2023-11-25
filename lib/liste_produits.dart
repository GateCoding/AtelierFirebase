import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ProduitItem.dart';
import 'produit.dart';

class ListeProduits extends StatefulWidget {
  const ListeProduits({super.key});

  @override
  State<ListeProduits> createState() => _ListeProduitsState();
}

class _ListeProduitsState extends State<ListeProduits> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste produits'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('produits').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Une erreur est survenue'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Produit> produits = snapshot.data!.docs.map((doc) {
            return Produit.fromFirestore(doc);
          }).toList();

          return ListView.builder(
            itemCount: produits.length,
            itemBuilder: (context, index) => ProduitItem(
              produit: produits[index],
            ),
          );
        },
      ),
    );
  }
}
