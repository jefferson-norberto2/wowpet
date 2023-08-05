
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';
import '../states/login_state.dart';

class LoginStore extends ValueNotifier<ILoginState>{
  final IGetUser _getUser;

  LoginStore(this._getUser) : super(EmptyLoginState());

  void emit(ILoginState state) => value = state;

  Future<void> login(User user) async {
    emit(LoadingLoginState());
    final result = await _getUser.call(user);

    final newState = result.fold((l) {
      return ErrorLoginState(l.message);
    }, (r) {
      return SucessLoginState(r);
    });

    emit(newState);
  }

  void cleanState() {
    emit(EmptyLoginState());
  }
}