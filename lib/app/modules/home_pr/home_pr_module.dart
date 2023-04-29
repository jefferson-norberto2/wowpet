import 'package:wowpet/app/modules/home_pr/home_pr_page.dart';
import 'package:wowpet/app/modules/home_pr/home_pr_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePrModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomePrStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePrPage()),
  ];
}
