import 'dart:convert';
import 'dart:io';

abstract class Animal {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  int rating = 10;

  Animal(this.name, this.location, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient httpClient = HttpClient();
    try {
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}
