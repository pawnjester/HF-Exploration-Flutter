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
  final myController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print("testing");
    futureCocktail = searchCocktails(searchText);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("object ${myController.text}");
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
                      searchCocktails(myController.text);
                    });
                  },
                  child: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
            const SizedBox(height: 20.0),
            Expanded(
                child: FutureBuilder<Drinks>(
              future: futureCocktail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.cocktails.length,
                      itemBuilder: (context, index) {
                        Cocktail cocktail = snapshot.data!.cocktails[index];
                        if (isButtonClicked &&
                            snapshot.data!.cocktails.isNotEmpty) {
                          return CockTailItem(cocktail: cocktail);
                        } else {
                          return Text("");
                        }
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ))
          ],
        ),
      ),
    );
  }
}
