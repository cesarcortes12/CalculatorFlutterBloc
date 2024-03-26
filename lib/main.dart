import 'package:calculator2/bloc/calculator/calculator_bloc.dart';
import 'package:calculator2/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider<CalculatorBloc>(create: (_) => CalculatorBloc())
    ],
     child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CalculatorScreen(),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    );
  }
}




/*TEORIA BLOC
  INICIAMOS CREANDO LAS CARPTEAS Y SOLO ES CLIC DERECHO EN LA CARPETA BLOC Y CREAR BLOC ,el crea una carpeta dentro de otra la cual renombramos

  1)ESTATE: es como va lucir nuestro estado es una clase en la cual se almacena informacion que no queremos que cambie, y si necesitamos 
  que cambie lo hacemos disparando un evento que creara una nueva instancia de la clase
  todo lo que se define en el estate es finalbasicamente el estate es el modelo

  2) EVENTOS: el bloc solo va  esperar eventos de su propio bloc , en el evento hay una clase inmutalbe abstracta y es co nla finalidad 
  de que el bloc sepa que solo v a recibiur eventos que extienden de esa clase
  cada clase que creamos es un evento 


  3) BLOC:  aqui para empezar el estado inicial que se le envia es el calculatorState es decir se inicializa con el modelo
     otra cosa : la funcion on es para que el bloc sepa que es un stream y no un future, un stream es un flujo de informacion
     un future es un valor que va a ser calculado y se va a enviar a un stream

      






 */
