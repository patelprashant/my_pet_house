import 'package:flutter/material.dart';
import 'package:my_pet_house/model/dog_animal.dart';
import 'package:my_pet_house/ui/animal_card.dart';

class DogList extends StatelessWidget {
  final List<Dog> doggos;

  const DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
        itemCount: doggos.length,
        itemBuilder: (context, int) {
          return AnimalCard(doggos[int]);
        });
  }
}
