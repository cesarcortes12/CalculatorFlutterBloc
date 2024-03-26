import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    //para resetear
    on<ResetAC>((event, emit) {
      emit(state.copyWith(
          mathResult: '0',
          firstNumbre: '0',
          secondNumber: '0',
          operation: '+'));
    });
    // para agregar un numero
    on<AddNumbre>((event, emit) {
      emit(state.copyWith(
          mathResult: state.mathResult == '0'
              ? event.number
              : state.mathResult + event.number));
      print('numero 1: ${event.number}');
    });

    //cambiar numeros a + o -
    on<ChangeNegativePostiver>((event, emit) {
      emit(state.copyWith(
          mathResult: state.mathResult.contains('-')
              ? state.mathResult.replaceFirst('-', '')
              : '-' + state.mathResult));
    });

    on<RemoveLastDigit>((event, emit) {
      emit(state.copyWith(
          mathResult: state.mathResult.length > 1
              ? state.mathResult.substring(0, state.mathResult.length - 1)
              : '0'));
    });

    on<OperationEntry>((event, emit) {
      emit(state.copyWith(
          firstNumbre: state.mathResult,
          mathResult: '0',
          operation: event.operation,
          secondNumber: '0'));
      // print('numero 1: ${state.firstNumbre}');
      print('numero 2: ${state.operation}');
    });

//calcular resultado

    on<FinalResult>((event, emit) {
      final double num1 = double.parse(state.firstNumbre);
      final double num2 = double.parse(state.mathResult);

      switch (state.operation) {
        case '+':
          emit(state.copyWith(
            secondNumber: state.mathResult,
            mathResult: (num1 + num2).toString(),
          ));
          break;

        case '-':
          emit(state.copyWith(
            secondNumber: state.mathResult,
            mathResult: (num1 - num2).toString(),
          ));
          break;

        case 'X':
          emit(state.copyWith(
            secondNumber: state.mathResult,
            mathResult: (num1 * num2).toString(),
          ));
          break;

        case '/':
          if (num2 != 0) {
            emit(state.copyWith(
              secondNumber: state.mathResult,
              mathResult: (num1 / num2).toString(),
            ));
          } else
            emit(state.copyWith(mathResult: 'error operacio invalida'));
      }
    });
  }
}
