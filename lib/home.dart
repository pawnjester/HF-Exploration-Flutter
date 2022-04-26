import 'package:explore_flutter/CockTailItem.dart';
import 'package:explore_flutter/Cocktail.dart';
import 'package:flutter/material.dart';
import 'NetworkHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Drinks> futureCocktail;

  bool isButtonClicked = false;
  String searchText = "";
  List<Cocktail> listOfCocktails = [];
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void getApiCall(String name) {
    searchCocktails(name).then((value) => {
          setState(() {
            listOfCocktails.clear();
            listOfCocktails.addAll(value.cocktails);
            isButtonClicked = true;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    if(isButtonClicked) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: myController,
                decoration:
                    const InputDecoration(hintText: "Enter a search item"),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    setState(() {
                      isButtonClicked = true;
                      getApiCall(myController.text);
                    });
                  },
                  child: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
            const SizedBox(height: 20.0),
            Expanded(
                child: ListView.builder(
                    itemCount: listOfCocktails.length,
                    itemBuilder: (context, index) {
                      Cocktail cocktail = listOfCocktails[index];
                      if (isButtonClicked && listOfCocktails.isNotEmpty) {
                        return CockTailItem(cocktail: cocktail);
                      } else {
                        return Text("");
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
