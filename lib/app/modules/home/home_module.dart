import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/home/initial/initial_module.dart';
import 'package:wowpet/app/modules/home/perfil/perfil_module.dart';
import 'package:wowpet/app/modules/home/report_animals/report_animals_module.dart';
import 'package:wowpet/app/modules/home/verify_animal/verify_animal_module.dart';
import 'stores/home_store.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage(user: args.data), children: [
      ModuleRoute('/initial_module/', module: InitialModule()),
      ModuleRoute('/report_animal_module/', module: ReportAnimalsModule()),
      ModuleRoute('/verify_animal_module/', module: VerifyAnimalModule()),
      ModuleRoute('/perfil_module/', module: PerfilModule()),      
    ]),
  ];
}
