import 'dart:convert';
import 'package:recipie_app/Models/recipie.dart';
import 'package:http/http.dart' as http;

class RecipieApi {
  static Future<List<Recipie>> getRecipie() async {
    var uri = Uri.http(
      'yummly2.p.rapidapi.com',
      'feeds/list',
      {
        "limit": '18',
        "start": '0',
        "tag": "list.recipe.popular",
      },
    );

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '0c452eb946msh9defa11a3397582p1de00cjsn215a516d4e2e',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['Feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipie.recipiesFromSnapshot(_temp);
  }
}
