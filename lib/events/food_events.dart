
import 'package:flutter_bloc_food_app/models/food.dart';

enum EventType {add, delete}
class FoodEvent {
  Food food;
  int foodIndex;
  EventType eventType;

  FoodEvent.add(Food food) {
    this.eventType = EventType.add;
    this.food = food;
  }

  FoodEvent.delete(int index) {
    this.eventType= EventType.delete;
    this.foodIndex = index;
  }
}