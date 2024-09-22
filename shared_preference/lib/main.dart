import "package:flutter/material.dart";
import "package:shared_preference/pages/save_data.dart";

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SaveData(),
    );
  }
}
