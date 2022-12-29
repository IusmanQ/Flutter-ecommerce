import 'package:flutter/material.dart';
import 'package:flutter_bloc_food_app/widgets/food_list.dart';

class FoodListScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Tutorial"),
      ),
      body: FoodList(),
    );
  }
}
