import 'package:flutter/material.dart';
import 'package:my_pet_house/model/animal.dart';
import 'package:my_pet_house/ui/animal_detail_page.dart';

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
    return InkWell(
      onTap: showAnimalDetailPage,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50.0,
                child: animalCard,
              ),
              Positioned(
                top: 7.5,
                child: animalImage,
              ),
            ],
          ),
        ),
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

  Widget get animalCard {
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
                    color: Colors.yellowAccent,
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

  void showAnimalDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AnimalDetailPage(animal);
    }));
  }
}
