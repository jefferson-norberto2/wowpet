import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/register_imunization_page.dart';

import 'presenter/pages/perfil_page.dart';

class PerfilModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const PerfilPage(), children: [
      ChildRoute('/register_imunization_page/', child: (_, args) => const ResgisterImunizationPage()),
    ]),
  ];
}