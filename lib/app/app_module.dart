import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/communication/communication_module.dart';

import 'modules/communication/communication.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => CommunicationStore())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CommunicationModule()),
  ];
}
