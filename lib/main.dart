import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_food_app/bloc/food_bloc.dart';
import 'package:flutter_bloc_food_app/screens/home_screen.dart';
import 'package:get/get.dart';

import 'bloc/food_bloc_delegate.dart';
import 'models/food.dart';

void main() {
  Bloc.observer = FoodBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (context) => FoodBloc(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
