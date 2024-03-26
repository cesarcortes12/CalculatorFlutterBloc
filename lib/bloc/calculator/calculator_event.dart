part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorEvent {}

class ResetAC extends CalculatorEvent {}

class AddNumbre extends CalculatorEvent {
  final String number;

  AddNumbre(this.number);
}

class ChangeNegativePostiver extends CalculatorEvent {}

class RemoveLastDigit extends CalculatorEvent {}

class OperationEntry extends CalculatorEvent {
  final String operation;

  OperationEntry(this.operation);
}

class FinalResult extends CalculatorEvent{}


/*NOTAS:
  Llas clases cuando reciben argumentos deben tener un constructor
   */