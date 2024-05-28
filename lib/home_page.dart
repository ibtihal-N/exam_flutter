
import 'package:flutter/material.dart';
import 'livres_page.dart';
import 'adherent_page.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/biblio.png"), // Assurez-vous que l'image est dans le répertoire assets

                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ibtihal Naime",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Bibliothéque publique",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              )

            ),
            ListTile(
              title: Text("Home", style: TextStyle(fontSize: 24)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Livres", style: TextStyle(fontSize: 24)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LivresPage()));
              },
              leading: Icon(Icons.book),
            ),
            ListTile(
              title: Text("Adhérents", style: TextStyle(fontSize: 24)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdherentsPage()));
              },
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("About", style: TextStyle(fontSize: 24)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
              },
              leading: Icon(Icons.info),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/2.png", // Assurez-vous que le chemin d'accès à l'image est correct
              width: 200, // Ajustez la largeur selon vos besoins
              height: 200, // Ajustez la hauteur selon vos besoins
            ),
            SizedBox(height: 20),
            Text(
              "Bienvenue à la Bibliothèque Publique",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "Explorez notre collection de livres et de ressources. Que vous soyez passionné de littérature, de science, d'histoire ou de tout autre sujet, notre bibliothèque propose une vaste sélection de livres pour répondre à vos besoins. Plongez-vous dans le monde captivant de la lecture et découvrez de nouvelles perspectives.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),

    );
  }
}
