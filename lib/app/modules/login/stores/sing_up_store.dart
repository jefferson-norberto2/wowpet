import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/communication/communication.dart';
import 'package:wowpet/app/modules/login/entities/user.dart';

class SignUpStore extends Store<bool> {
  SignUpStore() : super(false);
  final CommunicationStore communicationStore = Modular.get();

  Future<void> singUp(User user) async {
    setLoading(true);
    communicationStore.addUser(user);
    Modular.to.pushReplacementNamed('/home/');
    setLoading(false);
  }
}
