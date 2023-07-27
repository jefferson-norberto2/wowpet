import 'package:wowpet/app/modules/communication/communication.dart';
import 'package:wowpet/app/modules/home/home_module.dart';
import 'package:wowpet/app/modules/home_pr/home_pr_module.dart';
import 'package:wowpet/app/modules/login/pages/forgot_password_page.dart';
import 'package:wowpet/app/modules/login/pages/login_page.dart';
import 'package:wowpet/app/modules/login/stores/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/login/pages/register_pet_page.dart';
import 'package:wowpet/app/modules/login/pages/sign_up_page.dart';
import 'package:wowpet/app/modules/login/stores/sing_up_store.dart';
import 'pages/report_animal_page_1.dart';
import 'stores/forgot_password_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => LoginStore()),
    Bind.factory((i) => SignUpStore()),
    Bind.factory((i) => ForgotPasswordStore()),
    Bind.instance(CommunicationStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
    ChildRoute('/sign_up/', child: (_, args) => const SignUpScreen()),
    ChildRoute('/register_pet/', child: (_, args) => const RegisterPetScreen()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/home_pr/', module: HomePrModule()),
    ChildRoute('/test/', child: (_, args) => const ReportAnimalPage1()),
    ChildRoute('/forgot_password/', child: (_, args) => const ForgotPasswordPage())
  ];
}
