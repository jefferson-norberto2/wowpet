
import 'package:wowpet/app/modules/home/initial/domain/entities/pet.dart';

abstract class IInitialState {
}

class SuccessInitialState implements IInitialState {
  final List<Pet> pets;

  SuccessInitialState(this.pets);
}

class EmptyInitialState extends IInitialState{
}

class ErrorInitialState extends IInitialState{
  final String message;

  ErrorInitialState(this.message);
}

class LoadingInitialState extends IInitialState{}