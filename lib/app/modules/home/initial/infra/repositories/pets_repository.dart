import 'package:fpdart/fpdart.dart';
import 'package:wowpet/app/modules/home/initial/domain/erros/error.dart';
import 'package:wowpet/app/modules/home/initial/infra/adapters/pet_adapter.dart';

import '../../domain/entities/pet.dart';
import '../../domain/repositories/pets_repository.dart';
import '../datasources/pets_datasource.dart';

class PetsRepository extends IPetsRepository {
  final IPetsDatasource datasource;

  PetsRepository(this.datasource);

  @override
  Future<Either<IPetException, List<Pet>>> getLostPets() async {
    try {
      final pets = await datasource.getLostPets();
      final petsList = PetAdapter.getListPets(pets);
      return right(petsList);
    } on Exception {
      return left(const PetDatasourceException("Erro ao buscar pets"));
    }
  }
  
}