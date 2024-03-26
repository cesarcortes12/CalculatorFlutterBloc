import 'dart:ffi';

import 'package:calculator2/bloc/calculator/calculator_bloc.dart';
import 'package:calculator2/widgets/calc_button.dart';
import 'package:calculator2/widgets/line_separator.dart';
import 'package:calculator2/widgets/main_result.dart';
import 'package:calculator2/widgets/results_labels.dart';
import 'package:calculator2/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DECLARACION DEL BLOC PARA TENER ACCESO A EL DEDSDE ESTA PANTALLA
    //final bloc = context.watch<CalculatorBloc>();
    final calculatorbloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
 
            //este results es el widget que tiene todos los datos y desde
            //ese widget se maneja el bloc
            ResultsLabels(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                    text: 'AC',
                    bgColor: Color(0xffA5A5A5),
                    //onPressed: () => bloc.add(ResetAC()),
                    onPressed: () => calculatorbloc.add(ResetAC())),
                CalculatorButton(
                  text: '+/-',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calculatorbloc.add(ChangeNegativePostiver()),
                ),
                CalculatorButton(
                  text: 'del',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calculatorbloc.add(RemoveLastDigit()),
                ),
                CalculatorButton(
                  text: '/',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorbloc.add(OperationEntry('/')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '7',
                  onPressed: () => calculatorbloc.add(AddNumbre('7')),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => calculatorbloc.add(AddNumbre('8')),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => calculatorbloc.add(AddNumbre('9')),
                ),
                CalculatorButton(
                  text: 'X',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorbloc.add(OperationEntry('X')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '4',
                  onPressed: () => calculatorbloc.add(AddNumbre('4')),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => calculatorbloc.add(AddNumbre('5')),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => calculatorbloc.add(AddNumbre('6')),
                ),
                CalculatorButton(
                  text: '-',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorbloc.add(OperationEntry('-')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '1',
                  onPressed: () => calculatorbloc.add(AddNumbre('1')),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => calculatorbloc.add(AddNumbre('2')),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => calculatorbloc.add(AddNumbre('3')),
                ),
                CalculatorButton(
                  text: '+',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorbloc.add(OperationEntry('+')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '0',
                  big: true,
                  onPressed: () => calculatorbloc.add(AddNumbre('0')),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => calculatorbloc.add(AddNumbre('.')),
                ),
                CalculatorButton(
                  text: '=',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorbloc.add(FinalResult()),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
