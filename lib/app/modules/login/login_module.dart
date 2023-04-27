import 'package:wowpet/app/modules/home/home_module.dart';
import 'package:wowpet/app/modules/login/pages/login_page.dart';
import 'package:wowpet/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
    ModuleRoute('/home/', module: HomeModule())
  ];
}
