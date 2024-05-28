// lib/livres_page.dart
import 'package:flutter/material.dart';
import 'livre_details_page.dart';
import 'add_livre_page.dart';

class Livre {
  final String titre;
  final String auteur;
  final String image;
  final String description;

  Livre({
    required this.titre,
    required this.auteur,
    required this.image,
    required this.description,
  });
}

class LivresPage extends StatefulWidget {
  @override
  _LivresPageState createState() => _LivresPageState();
}

class _LivresPageState extends State<LivresPage> {
  List<Livre> livres = [
    Livre(
      titre: "Le Petit Prince",
      auteur: "Antoine de Saint-Exupéry",
      image: "assets/petit_prince.jpeg",
      description: "Le Petit Prince est une œuvre poétique et philosophique sous la forme d'un conte pour enfants. Il raconte l'histoire d'un aviateur tombé en panne dans le désert du Sahara qui rencontre un petit prince venu d'une autre planète. À travers les rencontres du Petit Prince avec divers personnages, le livre explore des thèmes tels que l'innocence, l'amour, l'amitié, et la perte. C'est une réflexion sur la nature humaine et la critique des valeurs des adultes.",
    ),
    Livre(
      titre: "Harry Potter à l'école des sorciers",
      auteur: "J.K. Rowling",
      image: "assets/harry.jpeg",
      description: "Premier tome de la célèbre série Harry Potter, ce livre introduit le jeune orphelin Harry Potter, qui découvre à l'âge de 11 ans qu'il est un sorcier. Il entre à l'école de sorcellerie Poudlard où il se fait des amis, découvre son passé et affronte le redoutable sorcier Voldemort. Ce roman pose les bases d'un univers magique riche en aventures et en mystères.",
    ),
    Livre(
      titre: "Le Seigneur des Anneaux : La Communauté de l'Anneau",
      auteur: "J.R.R. Tolkien",
      image: "assets/seigneur.jpeg",
      description: "Premier volume de la trilogie épique Le Seigneur des Anneaux, ce livre suit le hobbit Frodon Sacquet qui hérite d'un anneau puissant et maléfique. Avec ses amis et alliés, il forme une communauté pour détruire l'anneau en le jetant dans les flammes de la Montagne du Destin. Cette œuvre est une exploration profonde du bien contre le mal, de l'amitié, et du courage face aux ténèbres.",
    ),
    Livre(
      titre: "Le Nom de la Rose",
      auteur: "Umberto Eco",
      image: "assets/rose.jpeg",
      description: "Ce roman historique et policier se déroule dans une abbaye bénédictine du XIVe siècle. Le moine franciscain Guillaume de Baskerville et son novice Adso enquêtent sur une série de meurtres mystérieux. À travers une intrigue complexe, Umberto Eco explore des thèmes de théologie, de philosophie, et de logique, tout en offrant une critique de l'Inquisition et de l'obscurantisme religieux.",
    ),
    Livre(
      titre: "Le Vieil Homme et la Mer",
      auteur: "Ernest Hemingway",
      image: "assets/veille_homme.jpeg",
      description: "Ce court roman raconte l'histoire de Santiago, un vieux pêcheur cubain qui lutte pour attraper un énorme marlin dans le Gulf Stream. C'est une histoire de persévérance, de lutte contre la nature, et de la dignité humaine face à l'adversité. Hemingway explore des thèmes de courage, de résistance, et de l'héroïsme quotidien.",
    ),
    Livre(
      titre: "Les Misérables",
      auteur: "Victor Hugo",
      image: "assets/miserables.jpeg",
      description: "Épopée sociale et historique, Les Misérables se déroule dans la France du XIXe siècle et suit plusieurs personnages principaux, dont Jean Valjean, un ancien forçat en quête de rédemption, et Javert, le policier qui le poursuit sans relâche. Le roman traite de la justice, de la rédemption, de l'amour, de la révolution, et des inégalités sociales. C'est une critique passionnée de la société française et de ses injustices.",
    ),
  ];

  List<Livre> filteredLivres = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredLivres = livres;
    searchController.addListener(_filterLivres);
  }

  void _filterLivres() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredLivres = livres.where((livre) {
        return livre.titre.toLowerCase().contains(query) ||
            livre.auteur.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _addLivre(Livre livre) {
    setState(() {
      livres.add(livre);
      _filterLivres(); // Refiltrer la liste après l'ajout
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Livres"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Rechercher un livre',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLivres.length + 1, // Augmenter le count de 1 pour le bouton
              itemBuilder: (context, index) {
                if (index == filteredLivres.length) {
                  // Dernier élément est le bouton d'ajout
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddLivrePage(
                              onLivreAdded: (livre) {
                                _addLivre(livre);
                              },
                            ),
                          ),
                        );
                      },
                      child: Text("Ajouter un livre"),
                    ),
                  );
                } else {
                  return ListTile(
                    title: Text(filteredLivres[index].titre),
                    subtitle: Text(filteredLivres[index].auteur),
                    leading: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(filteredLivres[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailLivrePage(
                            titre: filteredLivres[index].titre,
                            auteur: filteredLivres[index].auteur,
                            image: filteredLivres[index].image,
                            description: filteredLivres[index].description,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
