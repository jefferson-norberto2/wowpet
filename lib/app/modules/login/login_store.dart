import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/communication/communication.dart';

class LoginStore extends Store<int> {
  LoginStore() : super(0);
  CommunicationStore communicationStore = Modular.get<CommunicationStore>();

  Future<void> login(String email, String password) async {
    setLoading(true);

    String? response = await communicationStore.login(email, password);

    if (response == null) {
      setError(1);
    } else {
      Modular.to.pushReplacementNamed('/home/');
    }

    setLoading(false);
  }
}
