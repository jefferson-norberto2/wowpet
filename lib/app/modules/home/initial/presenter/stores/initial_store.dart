
import 'package:flutter/material.dart';
import 'package:wowpet/app/modules/home/initial/domain/usecases/get_lost_pets.dart';
import 'package:wowpet/app/modules/home/initial/presenter/states/initial_state.dart';

class InitialStore extends ValueNotifier<IInitialState>{
  final IGetLostPets _getLostAnimals;

  InitialStore(this._getLostAnimals) : super(EmptyInitialState());

  void emit(IInitialState state) => value = state;

  Future<void> getLostPets() async {
    emit(LoadingInitialState());
    final result = await _getLostAnimals.call();

    final newState = result.fold((l) {
      return ErrorInitialState(l.message);
    }, (r) {
      return SuccessInitialState(r);
    });

    emit(newState);
  }

  void cleanState() {
    emit(EmptyInitialState());
  }
}