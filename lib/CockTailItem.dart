import 'dart:ui';

import 'package:explore_flutter/Cocktail.dart';
import 'package:flutter/material.dart';

class CockTailItem extends StatelessWidget {
  final Cocktail cocktail;

  const CockTailItem({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(cocktail.imageUrl),
                width: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cocktail.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(cocktail.category)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
