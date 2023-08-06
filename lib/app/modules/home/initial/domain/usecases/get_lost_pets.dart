import 'package:fpdart/fpdart.dart';
import '../repositories/pets_repository.dart';

import '../entities/pet.dart';
import '../erros/error.dart';

abstract class IGetLostPets{
  Future<Either<IPetException, List<Pet>>> call();
}

class GetLostPets implements IGetLostPets{
  final IPetsRepository repository;

  GetLostPets(this.repository);

  @override
  Future<Either<IPetException, List<Pet>>> call() async {
    try{
      return await repository.getLostPets();
    } catch (e) {
      throw Exception(e);
    }
  }
}