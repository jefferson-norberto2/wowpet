import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/report_animals_page.dart';

class ReportAnimalsModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ReportAnimalsPage()),
  ];
}