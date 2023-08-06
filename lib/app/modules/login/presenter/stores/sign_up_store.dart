
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_up.dart';
import '../states/sign_up_state.dart';

class SignUpStore extends ValueNotifier<ISignUpState>{
  final ISignUp _sendUser;

  SignUpStore(this._sendUser) : super(EmptySignUpState());

  void emit(ISignUpState state) => value = state;

  Future<void> registerUser(User user) async {
    emit(LoadingSignUpState());
    final result = await _sendUser.call(user);

    final newState = result.fold((l) {
      return ErrorSignUpState(l.message);
    }, (r) {
      if (r) {
        return SuccessSignUpState("Usuário cadastrado com sucesso!");
      }else{
        return ErrorSignUpState("Problema ao cadastrar usuário");
      }
      
    });

    emit(newState); 
  }

  void cleanState() {
    emit(EmptySignUpState());
  }
}