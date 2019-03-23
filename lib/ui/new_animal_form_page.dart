import 'package:flutter/material.dart';
import 'package:my_pet_house/model/dog_animal.dart';

class AddAnimalFormPage extends StatefulWidget {
  @override
  _AddAnimalFormPageState createState() => _AddAnimalFormPageState();
}

class _AddAnimalFormPageState extends State<AddAnimalFormPage> {
  TextEditingController animalNameController = TextEditingController();
  TextEditingController animalLocationController = TextEditingController();
  TextEditingController animalDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Animal'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: animalNameController,
                  onChanged: (v) => animalNameController.text = v,
                  decoration: InputDecoration(
                    labelText: 'Name the Animal',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: animalLocationController,
                  onChanged: (v) => animalLocationController.text = v,
                  decoration: InputDecoration(
                    labelText: 'Location of the Animal',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: animalDescController,
                  onChanged: (v) => animalDescController.text = v,
                  decoration: InputDecoration(
                    labelText: 'All about the Animal',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                        child: Text("Submit Animal",
                            style: TextStyle(fontSize: 16)),
                        padding: EdgeInsets.all(12),
                        color: Colors.indigoAccent,
                        textColor: Colors.white,
                        onPressed: () => submitAnimal(context));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  submitAnimal(BuildContext context) {
    if (animalNameController.text.isEmpty ||
        animalLocationController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Animal Name and Location can not be empty')));
    } else {
      var newAnimal = Dog(animalNameController.text,
          animalLocationController.text, animalDescController.text, 'Breed B');
      Navigator.of(context).pop(newAnimal);
    }
  }
}
