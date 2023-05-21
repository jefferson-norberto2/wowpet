import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wowpet/app/modules/communication/communication_module.dart';

void main() {
  setUpAll(() {
    initModule(CommunicationModule());
  });
}
