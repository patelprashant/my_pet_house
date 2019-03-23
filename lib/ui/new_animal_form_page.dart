import 'package:flutter/material.dart';

class AddAnimalFormPage extends StatefulWidget {
  @override
  _AddAnimalFormPageState createState() => _AddAnimalFormPageState();
}

class _AddAnimalFormPageState extends State<AddAnimalFormPage> {
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
                  decoration: InputDecoration(
                    labelText: 'Name the Animal',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Location of the Animal',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
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
                        onPressed: () => {
                              print('Animal Added'),
                            });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
