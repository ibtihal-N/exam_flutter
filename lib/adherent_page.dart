// lib/adherents_page.dart
import 'package:flutter/material.dart';
import 'adherent.dart';
import 'adherent_details_page.dart';
import 'add_adherent_page.dart';

class AdherentsPage extends StatefulWidget {
  @override
  _AdherentsPageState createState() => _AdherentsPageState();
}

class _AdherentsPageState extends State<AdherentsPage> {
  List<Adherent> adherents = [
    Adherent(
      nom: "Ibtihal Naime",
      email: "naime.doe@gmail.com",
      image: "assets/fille1.jpeg",
      description: "John est un passionné de lecture et adore les livres de science-fiction.",
    ),
    Adherent(
      nom: "Yassine Naime",
      email: "yassine@gmail.com",
      image: "assets/garçon.jpeg",
      description: "Jane est une bibliothécaire qui aime les romans classiques.",
    ),
    Adherent(
      nom: "Ihsane Naime",
      email: "ihsane.doe@gmail.com",
      image: "assets/fille2.jpeg",
      description: "John est un passionné de lecture et adore les livres de science-fiction.",
    ),
  ];

  void _addAdherent(Adherent adherent) {
    setState(() {
      adherents.add(adherent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adhérents"),
      ),
      body: ListView.builder(
        itemCount: adherents.length + 1, // Augmenter le count de 1 pour le bouton
        itemBuilder: (context, index) {
          if (index == adherents.length) {
            // Dernier élément est le bouton d'ajout
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAdherentPage(
                        onAdherentAdded: (adherent) {
                          _addAdherent(adherent);
                        },
                      ),
                    ),
                  );
                },
                child: Text("Ajouter un adhérent"),
              ),
            );
          } else {
            return ListTile(
              title: Text(adherents[index].nom),
              subtitle: Text(adherents[index].email),
              leading: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(adherents[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailAdherentPage(
                      nom: adherents[index].nom,
                      email: adherents[index].email,
                      image: adherents[index].image,
                      description: adherents[index].description,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
