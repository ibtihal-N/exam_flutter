
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("À propos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "À propos de la Bibliothèque",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Cette application a été créée pour faciliter la gestion des livres et des adhérents d'une bibliothèque. "
                  "Elle permet d'ajouter, de visualiser et de gérer les livres ainsi que les adhérents de manière efficace.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Fonctionnalités de l'application :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Afficher une liste de livres avec leurs détails\n"
                  "- Ajouter de nouveaux livres à la liste\n"
                  "- Afficher une liste d'adhérents avec leurs détails\n"
                  "- Ajouter de nouveaux adhérents à la liste",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Développeurs :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Cette application a été développée par NAIME Ibtihal. j'espére qu'elle vous sera utile pour gérer efficacement votre bibliothèque.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
