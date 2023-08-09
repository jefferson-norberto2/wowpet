import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/report_animals_page.dart';
import 'presenter/stores/report_animals_store.dart';

class ReportAnimalsModule extends Module {
  @override
  final List<Bind> binds = [
    //stores
    Bind.singleton((i) => ReportAnimalStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ReportAnimalsPage()),
  ];
}