import 'package:wowpet/app/modules/home/home_module.dart';
import 'package:wowpet/app/modules/home_pr/home_pr_module.dart';
import 'package:wowpet/app/modules/login/pages/login_page.dart';
import 'package:wowpet/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/login/pages/register_pet_screen.dart';
import 'package:wowpet/app/modules/login/pages/sign_up_screen.dart';

import '../home/test.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
    ChildRoute('/sign_up/', child: (_, args) => SignUpScreen()),
    ChildRoute('/register_pet/', child: (_, args) => RegisterPetScreen()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/home_pr/', module: HomePrModule()),
    ChildRoute('/test/', child: (_, args) => const MyApp2()),
  ];
}
