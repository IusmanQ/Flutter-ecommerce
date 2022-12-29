import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_food_app/bloc/food_bloc.dart';
import 'package:flutter_bloc_food_app/events/food_events.dart';
import 'package:flutter_bloc_food_app/models/food.dart';
import 'package:flutter_bloc_food_app/widgets/food_list.dart';
import 'package:get/get.dart';

import 'food_list_screen.dart';

class HomeScreen extends StatelessWidget {

   String _foodText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Tutorial'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("An App", style: TextStyle(fontSize: 42),),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Food",
              ),
              style: TextStyle(fontSize: 22.0),
              onChanged: (value) {
                  _foodText = value;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Expanded(child: FoodList()),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(Food(_foodText))),
          child: Icon(Icons.save),
          heroTag: "Button1",
          ),
          SizedBox(height: 5.0),
          FloatingActionButton(
            onPressed: () {
              Get.to(FoodListScreen());
            },
            child: Icon(Icons.navigate_next),
            heroTag: "Button2",
          )
        ],
      ),
    );
  }
}
