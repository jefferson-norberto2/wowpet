import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:wowpet/app/modules/home/initial/presenter/stores/initial_store.dart';
import 'domain/usecases/get_lost_pets.dart';
import 'domain/repositories/pets_repository.dart';
import 'external/datasources/pets_datasource.dart';
import 'infra/datasources/pets_datasource.dart';
import 'infra/repositories/pets_repository.dart';
import 'presenter/pages/initial_page.dart';

class InitialModule extends Module {
  @override
  final List<Bind> binds = [
    //utils
    Bind.factory((i) => http.Client()),

    //datasources
    Bind.factory<IPetsDatasource>((i) => PetsDatasource(i())),
    
    //repositories
    Bind.factory<IPetsRepository>((i) => PetsRepository(i())),

    //usecases
    Bind.factory((i) => GetLostPets(i())),

    //stores
    Bind.singleton((i) => InitialStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => const InitialPage()),
  ];

  
}