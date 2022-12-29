import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_food_app/bloc/food_bloc.dart';
import 'package:flutter_bloc_food_app/events/food_events.dart';
import 'package:flutter_bloc_food_app/models/food.dart';
import 'package:get/get.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<FoodBloc, List<Food>>(
        buildWhen: (List<Food> previous, List<Food> current) {
          return true;
        },
        listenWhen: (List<Food> previous, List<Food> current) {
          if (current.length > previous.length) {
            return true;
          }

          return false;
        },
        builder: (context, foodList){
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: foodList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.orange,
                    child: ListTile(
                      title: Text(foodList[index].name),
                      onTap: () => BlocProvider.of<FoodBloc>(context).add(FoodEvent.delete(index))
                    ),
                  )
                );
              });
        },
        listener: (BuildContext context, foodList) {
          Get.snackbar("Added", "Food Item is added");
        },
      )

    );
  }
}
