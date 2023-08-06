import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/home/initial/initial_module.dart';
import '../login/presenter/pages/report_animal_page_1.dart';
import 'initial/presenter/pages/initial_page.dart';
import 'stores/home_store.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage(user: args.data)),
    ChildRoute('/test/', child: (_, args) => const ReportAnimalPage1()),
    ChildRoute('/initial2/', child: (_, args) => const InitialPage()),
    ModuleRoute('/initial/', module: InitialModule())
  ];
}
