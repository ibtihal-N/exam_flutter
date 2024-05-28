import 'package:flutter/material.dart';
import 'livres_page.dart';

class AddLivrePage extends StatefulWidget {
  final Function(Livre) onLivreAdded;

  AddLivrePage({required this.onLivreAdded});

  @override
  _AddLivrePageState createState() => _AddLivrePageState();
}

class _AddLivrePageState extends State<AddLivrePage> {
  final _formKey = GlobalKey<FormState>();
  String _titre = '';
  String _auteur = '';
  String _image = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un nouveau livre"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Titre"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer le titre";
                  }
                  return null;
                },
                onSaved: (value) {
                  _titre = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Auteur"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer l'auteur";
                  }
                  return null;
                },
                onSaved: (value) {
                  _auteur = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "URL de l'image de couverture"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer l'URL de l'image";
                  }
                  return null;
                },
                onSaved: (value) {
                  _image = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer la description";
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onLivreAdded(Livre(
                      titre: _titre,
                      auteur: _auteur,
                      image: _image,
                      description: _description,
                    ));
                    Navigator.pop(context);
                  }
                },
                child: Text("Ajouter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
