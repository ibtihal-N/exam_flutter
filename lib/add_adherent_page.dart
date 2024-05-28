// lib/add_adherent_page.dart
import 'package:flutter/material.dart';
import 'adherent.dart';

class AddAdherentPage extends StatefulWidget {
  final Function(Adherent) onAdherentAdded;

  AddAdherentPage({required this.onAdherentAdded});

  @override
  _AddAdherentPageState createState() => _AddAdherentPageState();
}

class _AddAdherentPageState extends State<AddAdherentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un adhérent"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: "URL de l'image"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer l'URL de l'image";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    Adherent newAdherent = Adherent(
                      nom: _nomController.text,
                      email: _emailController.text,
                      image: _imageController.text,
                      description: _descriptionController.text,
                    );
                    widget.onAdherentAdded(newAdherent);
                    Navigator.pop(context);
                  }
                },
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
