import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:wowpet/app/modules/home/home_module.dart';
import 'package:wowpet/app/modules/login/presenter/pages/register_pet_page.dart';
import 'package:wowpet/app/modules/login/presenter/pages/sign_in_page.dart';
import 'package:wowpet/app/modules/login/presenter/pages/sign_up_page.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user.dart';
import 'domain/usecases/send_user.dart';
import 'external/datasources/user_datasources.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repositories/user_repository.dart';
import 'presenter/stores/login_store.dart';
import 'presenter/stores/sign_up_store.dart';

class LoginModule extends Module{
  @override
  List<Bind<Object>> get binds => [
    //utils
    Bind.factory((i) => http.Client()),
    //datasources
    Bind.factory<IUserDatasource>((i) => UserDatasource(i())),
    //repositories
    Bind.factory<IUserRepository>((i) => UserRepository(i())),
    //usecases
    Bind.factory((i) => GetUser(i())),
    Bind.factory((i) => SendUser(i())),
    //stores
    Bind.singleton((i) => LoginStore(i())),
    Bind.singleton((i) => SignUpStore(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => const SignInPage()),
    ChildRoute('/sign_up/', child: (context, args) => const SignUpScreen()),
    ChildRoute('/add_pet/', child: (context, args) => const RegisterPetScreen()),
    ModuleRoute('/home/', module: HomeModule()),
  ];
}