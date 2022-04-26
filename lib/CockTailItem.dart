import 'dart:ui';

import 'package:flutter/material.dart';

class CockTailItem extends StatelessWidget {

  const CockTailItem({Key? key}) : super(key: key);

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
              const Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'), width: 80,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("First data", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text("Second data")
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