import 'package:my_pet_house/model/animal.dart';

class Dog extends Animal {
  final String breed;

  Dog(String name, String location, String description, this.breed)
      : super(name, location, description);
}
