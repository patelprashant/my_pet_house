import 'package:flutter/material.dart';
import 'package:my_pet_house/model/dog_animal.dart';
import 'package:my_pet_house/ui/dog_list.dart';
import 'package:my_pet_house/ui/new_animal_form_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dogs',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'We Rate Animals'),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDogList = []
    ..add(Dog(
        'Ruby',
        'Portland OR USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.',
        'Breed A'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999', 'Breed B'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.', 'Breed C'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy', 'Breed B'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999', 'Breed B'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.', 'Breed C'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy', 'Breed B'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999', 'Breed B'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.', 'Breed C'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy', 'Breed B'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.',
        'Breed A'));

  Future _showNewAnimalForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddAnimalFormPage();
    }));

    if (newDog != null) {
      initialDogList.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewAnimalForm,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[500],
              Colors.indigo[400]
            ])),
        child: DogList(initialDogList),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
