abstract class IReportAnimalState{}

class ReportAnimalInitialState implements IReportAnimalState{}

class ReportAnimalLoadingState implements IReportAnimalState{}

class ReportAnimalSuccessState implements IReportAnimalState{
  final String message;

  ReportAnimalSuccessState({required this.message});
}

class ReportAnimalErrorState implements IReportAnimalState{
  final String message;

  ReportAnimalErrorState({required this.message});
}