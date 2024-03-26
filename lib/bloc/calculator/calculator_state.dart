part of 'calculator_bloc.dart';

@immutable
 class CalculatorState {
  
  final String mathResult;
  final String firstNumbre;
  final String secondNumber;
  final String operation;

  const CalculatorState( {
    
    this.mathResult = '0', 
    this.firstNumbre='0', 
    this.secondNumber='0', 
    this.operation = '+'
    
    });

  CalculatorState copyWith({
    String? mathResult,
    String? firstNumbre,
    String? secondNumber,
    String? operation,
  }) {
    return CalculatorState(
      mathResult: mathResult ?? this.mathResult,
      firstNumbre: firstNumbre ?? this.firstNumbre,
      secondNumber: secondNumber ?? this.secondNumber,
      operation: operation ?? this.operation
    );
  }


}
