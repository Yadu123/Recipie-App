import 'package:flutter/material.dart';
import 'package:recipie_app/Models/recipie.dart';
import 'package:recipie_app/Models/recipie_api.dart';
import 'package:recipie_app/Views/Widgets/recipie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipie> _recipies;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getRecipies() async {
    _recipies = await RecipieApi.getRecipie();
    setState(() {
      _isLoading = false;
    });
    print(_recipies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.restaurant_menu,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Food Recipie',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipies.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    title: _recipies[index].name,
                    rating: _recipies[index].rating.toString(),
                    cookTime: _recipies[index].totaltime,
                    thumbnailUrl: _recipies[index].images,
                  );
                },
              ));
  }
}
