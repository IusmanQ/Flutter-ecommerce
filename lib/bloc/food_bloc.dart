
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_food_app/events/food_events.dart';
import 'package:flutter_bloc_food_app/models/food.dart';

class FoodBloc extends Bloc<FoodEvent, List<Food>> {
  FoodBloc([List<Food> props = const []]) : super(props);


  @override
  Stream<List<Food>> mapEventToState(FoodEvent event) async* {
    // TODO: implement mapEventToState
    switch(event.eventType){
      case EventType.add:
        List<Food> newState = List.from(state);
        if(event.food != null) {
          newState.add(event.food);
          yield newState;
        }
        break;
      case EventType.delete:
        List<Food> newState = List.from(state);
        newState.removeAt(event.foodIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }

}