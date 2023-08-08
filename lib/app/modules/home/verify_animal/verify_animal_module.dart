import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/home/verify_animal/presenter/pages/verify_nfc_page.dart';

class VerifyAnimalModule extends Module {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => const VerifyNfcPage())
  ];

}