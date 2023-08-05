
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/send_user.dart';
import '../states/sign_up_state.dart';

class SignUpStore extends ValueNotifier<ISignUpState>{
  final ISendUser _sendUser;

  SignUpStore(this._sendUser) : super(EmptySignUpState());

  void emit(ISignUpState state) => value = state;

  Future<void> registerUser(User user) async {
    emit(LoadingSignUpState());
    final result = await _sendUser.call(user);

    final newState = result.fold((l) {
      return ErrorSignUpState(l.message);
    }, (r) {
      if (r.id!.isEmpty) {
        return ErrorSignUpState("E-mail já cadastrado!");
      }
      return SuccessSignUpState(r);
    });

    emit(newState); 
  }

  void cleanState() {
    emit(EmptySignUpState());
  }
}