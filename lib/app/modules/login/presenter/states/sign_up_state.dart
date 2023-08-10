
abstract class ISignUpState {}

class SuccessSignUpState implements ISignUpState {
  final String message;

  SuccessSignUpState(this.message);
  
}

class EmptySignUpState extends ISignUpState{
}

class ErrorSignUpState extends ISignUpState{
  final String message;

  ErrorSignUpState(this.message);
}

class LoadingSignUpState extends ISignUpState{}