import 'package:atelier4pelamriiir5g7/produit.dart';
import 'package:flutter/material.dart';

class ProduitItem extends StatelessWidget {
  final Produit produit;

  ProduitItem({required this.produit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(produit.designation),
      subtitle: Text(produit.marque),
      trailing: Text('${produit.prix}'),
    );
  }
}
