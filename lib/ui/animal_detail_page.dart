import 'package:flutter/material.dart';
import 'package:my_pet_house/model/dog_animal.dart';

class AnimalDetailPage extends StatefulWidget {
  final Dog dog;

  AnimalDetailPage(this.dog);

  @override
  _AnimalDetailPageState createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  final double animalAvatarSize = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Meet ${widget.dog.name}'),
      ),
      body: animalProfile,
    );
  }

  Widget get animalProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          animalImage,
          Text(
            '${widget.dog.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            '${widget.dog.location}',
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            child: Text('${widget.dog.description}'),
          ),
          animalRating
        ],
      ),
    );
  }

  Widget get animalImage {
    return Container(
      height: animalAvatarSize,
      width: animalAvatarSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(
                offset: const Offset(1.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: -1.0,
                color: Color(0x33000000)),
            const BoxShadow(
                offset: const Offset(2.0, 1.0),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: Color(0x24000000)),
            const BoxShadow(
                offset: const Offset(3.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: Color(0x1F000000)),
          ],
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(widget.dog.imageUrl))),
    );
  }

  Widget get animalRating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(
          '${widget.dog.rating} / 10',
          style: Theme.of(context).textTheme.display3,
        )
      ],
    );
  }
}
