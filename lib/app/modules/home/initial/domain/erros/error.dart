abstract class IPetException{
  final String message;
  final StackTrace? stackTrace;
  
  const IPetException(this.message, [this.stackTrace]);
}

class PetException extends IPetException{
  const PetException(super.message, [super.stackTrace]);
}

class PetDatasourceException extends IPetException{
  const PetDatasourceException(super.message, [super.stackTrace]);
}
