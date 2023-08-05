
import '../../domain/entities/user.dart';

abstract class ISignUpState {}

class SuccessSignUpState implements ISignUpState {
  final User user;

  SuccessSignUpState(this.user);
  
}

class EmptySignUpState extends ISignUpState{
}

class ErrorSignUpState extends ISignUpState{
  final String message;

  ErrorSignUpState(this.message);
}

class LoadingSignUpState extends ISignUpState{}