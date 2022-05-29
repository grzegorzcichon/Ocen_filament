import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFilamentPageContent extends StatefulWidget {
  const AddFilamentPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddFilamentPageContent> createState() => _AddFilamentPageContentState();
}

class _AddFilamentPageContentState extends State<AddFilamentPageContent> {
  var producentName = '';
  var filamentName = '';
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę producenta',
            ),
            onChanged: (newValue) {
              setState(() {
                producentName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę filamentu',
            ),
            onChanged: (newValue) {
              setState(() {
                filamentName = newValue;
              });
            },
          ),
          Slider(
            onChanged: (
              newValue,
            ) {
              setState(() {
                rating = newValue;
              });
            },
            value: rating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('Filament').add({
                'name': producentName,
                'material': filamentName,
                'rating': rating,
              });
            },
            child: const Text('Dodaj'),
          )
        ],
      ),
    );
  }
}
