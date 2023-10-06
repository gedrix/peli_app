import 'package:flutter/material.dart';




class Full_screen_loader extends StatelessWidget {
  const Full_screen_loader({super.key});

  

  Stream<String> getLoadingMessage(){
    final message = <String>[
      'Cargando Peliculas',
      'Comprando canguil',
      'Cargando Peliculas populares',
      'ya mismo...',
      'Esto esta tardando mas de lo esperado',
    ];
  
    return Stream.periodic(const Duration(milliseconds: 1200), (step){
      return message[step];
    }).take(message.length);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children:  [
              const SizedBox(height: 50,),
              const Text('Espere por favor'),
              const CircularProgressIndicator(strokeWidth: 2,),
              const  SizedBox(height: 50,),
              StreamBuilder(
                stream: getLoadingMessage(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Cargando');

                  return Text(snapshot.data!);
                },
              ),
          ],
        ),
      );
  }
}