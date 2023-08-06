import 'package:fpdart/fpdart.dart';
import 'package:wowpet/app/modules/home/initial/domain/repositories/pets_repository.dart';

import '../entities/pet.dart';
import '../erros/error.dart';

abstract class IGetLostAnimals{
  Future<Either<IPetException, List<Pet>>> getLostAnimals();
}

class GetLostAnimals implements IGetLostAnimals{
  final IPetsRepository repository;

  GetLostAnimals(this.repository);

  @override
  Future<Either<IPetException, List<Pet>>> getLostAnimals() async {
    try{
      return await repository.getLostPets();
    } catch (e) {
      throw Exception(e);
    }
  }
}