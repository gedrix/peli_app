import 'package:cloncines/config/constants/environment.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(children: [
          Icon(
            Icons.movie_outlined,
            color: colors.primary,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            Environment.nameApp,
            style: titleStyle,
          ),
          const Spacer(),
          IconButton(
              onPressed: (){
                //*acciones para realizar busqueda
              }, 
              icon: const Icon(Icons.search)
            )
        ]),
      ),
    ));
  }
}
