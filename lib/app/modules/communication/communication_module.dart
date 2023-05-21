import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/communication/communication.dart';

import '../login/login_module.dart';

class CommunicationModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => CommunicationStore())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
