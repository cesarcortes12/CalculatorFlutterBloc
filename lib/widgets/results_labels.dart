import 'package:calculator2/bloc/calculator/calculator_bloc.dart';
import 'package:calculator2/widgets/line_separator.dart';
import 'package:calculator2/widgets/main_result.dart';
import 'package:calculator2/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsLabels extends StatelessWidget {
  const ResultsLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(children: [
          SubResult(text: state.firstNumbre),
          SubResult(text: state.operation),
          SubResult(text: state.secondNumber),
          LineSeparator(),
          MainResultText(
              text: state.mathResult.endsWith('.0')
                  ? state.mathResult.substring(0, state.mathResult.length - 2)
                  : state.mathResult),
        ]);
      },
    );
  }
}




/*FLUJO DE UN BLOC
es un gestor de estados , cundo unwidget necesita hacer un cambio al estado dispara un evento
recibido por el bloc , lo recibe l opreocesa y crea un nuevo estado 
el bloc notifica a los widgets que esten escuchando esos cambios  

el bloc va en este caso a la pantalla de calculador donde estan los valores que continuamente estan
cambiando,entonces en el estate tenemos nuestro modelo  con el constructor y sus varialbes 
inicilazadas(por ejemplo en el cosumo de un endpoint aqui se reciben las variables que yo necesite  eso si depsues de haber pasado 
por un datasource y un repositorio una vez validada esa informacion
ya se pasa al bloc) 
en los eventos creamos las clases con los eventos y estos son los que van a poner en funcionamineto  el bloc cuando se made a llmamar

 entonces cuando se mande a llamar el evento el bloc va a  crear un nuevo estado y va a notificar a los widgets que esten escuchando
para redibujarlos 

cuando necesitemos que la implemetacio ndel bolc sea global , porque toda la aplicacion necesita tener acceso al bloc lo podemos ponber en main
pero si son solo algunos widgets , entonces lo podemos hacer en el widget padre en este caso en widget padre o el widget que lo necesite
en este caso en el main
ahi  se pone el multibloc provider


desde este widgewt resultsLabels se va a menajr la logica del bloc aqui esta lo importante y la raiz del gestor de estados
entonces lo que es el column lo cambiamos por un blocBuilder, y le especificamos sobre que bloc vamos a trabajar y sobre que state tambien 
en este caso el state es el calculatorState y el bloc es el calculatorBloc


entonce sun vezq eu nosotros tengamos el state y el bloc ya ahi podemos manipular la informacion que viene en ellos
y lo hacemos por ejemplo llamando los datos en cad uno de los labels como por ejuemplo
 SubResult(text: state.firstNumbre),


y cada vez que haya un evento o una operacion que cvambie el state o genere un nuevo state se va redibuja esta parte

segun el flujo entonces siguen los eventos

COMO DISPARAR UN EVENTO:

en  el calculator bloc tenemos los disparadores de eventos que son los on
entonces por cada clase o evento creado en el claculatorEvent entonces hay un on por cada uno}
dentro del on ya se implementa la logica

IMPORTANTE: par apoder llamar los datos que contenga un bloc en algun widget
entonces declaramos un varaible que va a tener esa invocacion como por ejemplo algunas de estas dos opciones
final bloc = context.watch<CalculatorBloc>(); 
final calculatorbloc = BlocProvider.of<CalculatorBloc>(context);
con esa linea le indicamos que va a observar el contxto de CalculatorBlock
y en campo donde necesitemos el dato lo podemos llamar de estas dos maneras 
onPressed: () => bloc.add(ResetAC()),
 onPressed: () => calculatorbloc.add(ResetAC())


ojo: para que el evento ejecute una funcion entonces debe estar programda
y esa funcio esta en el calculatorBloc


COPYWTIH:  esto lo que hace es regrasar un nuevo estado entonces ene ste casi lo que hacemos es signar el valor a los labels por defecto o si son ingresados 
que conserve ese estado.
es muy importante crear copias del estado con ese coopywith.
en este caso tenemos el copywith en el estado y cuando se  mande a llamar desde el bloc el va a crear una copia de ese estado y va a realiza las
acciones con los valores que le llegan



 */