import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/communication/communication.dart';

class ForgotPasswordStore extends Store<int> {
  ForgotPasswordStore() : super(0);
  CommunicationStore communicationStore = Modular.get<CommunicationStore>();

  Future<void> login(String? email, String? password) async {

    bool? response = await communicationStore.recover_password(email, password);

    if (response) {
      Modular.to.pop();
    } else {
      setError(1);
    }
  }
}
