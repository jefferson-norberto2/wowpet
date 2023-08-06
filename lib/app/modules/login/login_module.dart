import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:wowpet/app/modules/home/home_module.dart';
import 'package:wowpet/app/modules/login/external/datasources/sign_in_datasource.dart';
import 'package:wowpet/app/modules/login/external/datasources/sign_up_datasource.dart';
import 'package:wowpet/app/modules/login/infra/datasources/sign_in_datasource.dart';
import 'package:wowpet/app/modules/login/infra/datasources/sign_up_datasource.dart';
import 'package:wowpet/app/modules/login/presenter/pages/report_animal_page_1.dart';
import 'package:wowpet/app/modules/login/presenter/pages/sign_in_page.dart';
import 'package:wowpet/app/modules/login/presenter/pages/sign_up_page.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/sign_in.dart';
import 'domain/usecases/sign_up.dart';
import 'infra/repositories/user_repository.dart';
import 'presenter/stores/login_store.dart';
import 'presenter/stores/sign_up_store.dart';

class LoginModule extends Module{
  @override
  List<Bind<Object>> get binds => [
    //utils
    Bind.factory((i) => http.Client()),
    //datasources
    Bind.factory<ISignInDatasource>((i) => SignInDatasource(i())),
    Bind.factory<ISignUpDatasource>((i) => SignUpDatasource(i())),
    //repositories
    Bind.factory<IUserRepository>((i) => UserRepository(i(), i())),
    //usecases
    Bind.factory((i) => GetUser(i())),
    Bind.factory((i) => SignUp(i())),
    //stores
    Bind.singleton((i) => LoginStore(i())),
    Bind.singleton((i) => SignUpStore(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => const SignInPage()),
    ChildRoute('/sign_up/', child: (context, args) => const SignUpPage()),
    ChildRoute('/report_animal/', child: (context, args) => const ReportAnimalPage1()),
    ModuleRoute('/home/', module: HomeModule()),
  ];
}