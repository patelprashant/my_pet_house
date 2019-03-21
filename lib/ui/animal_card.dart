import 'package:flutter/material.dart';
import 'package:my_pet_house/model/animal.dart';

class AnimalCard extends StatefulWidget {
  final Animal animal;

  const AnimalCard(this.animal);

  @override
  _AnimalCardState createState() => _AnimalCardState(animal);
}

class _AnimalCardState extends State<AnimalCard> {
  Animal animal;
  String renderUrl;

  _AnimalCardState(this.animal);

  @override
  void initState() {
    super.initState();
    renderAnimalPic();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 50.0,
            child: dogCard,
          ),
          Positioned(
            top: 7.5,
            child: animalImage,
          ),
        ],
      ),
    );
  }

  Widget get animalImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(renderUrl ?? ''))),
    );
  }

  Widget get dogCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                widget.animal.name,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                widget.animal.location,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.animal.rating} / 10'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void renderAnimalPic() async {
    await animal.getImageUrl();
    setState(() {
      renderUrl = animal.imageUrl;
    });
  }
}
