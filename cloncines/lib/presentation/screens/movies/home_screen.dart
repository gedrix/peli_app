import 'package:cloncines/presentation/providers/providers.dart';
import 'package:cloncines/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation() ,
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPate();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowsProvider);
  
   
    return CustomScrollView( //* me permite tener el appbar flotante tambien se puede utilizar el SingleChildScrollView
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index){
                return Column(
                        children: [
                    
                          MoviesSlideshow(movies: slideShowMovies),
                    
                          MovieHorizontalListview(
                              movies:nowPlayingMovies,
                              title: 'En cines',
                              subtitle: 'Hoy',
                              loadNextPage: (){
                                ref.read(nowPlayingMoviesProvider.notifier).loadNextPate();
                              },
                            ),
                            MovieHorizontalListview(
                              movies:nowPlayingMovies,
                              title: 'Proximanente',
                              subtitle: 'Este mes',
                              loadNextPage: (){
                                ref.read(nowPlayingMoviesProvider.notifier).loadNextPate();
                              },
                            ),
                            
                            MovieHorizontalListview(
                              movies:nowPlayingMovies,
                              title: 'Populares',
                              subtitle: 'Este mes',
                              loadNextPage: (){
                                ref.read(nowPlayingMoviesProvider.notifier).loadNextPate();
                              },
                            ),
                            
                            MovieHorizontalListview(
                              movies:nowPlayingMovies,
                              title: 'Mejores Calificadas',
                              subtitle: 'Este mes',
                              loadNextPage: (){
                                ref.read(nowPlayingMoviesProvider.notifier).loadNextPate();
                              },
                            ),

                            const SizedBox(height: 10,)
                          
                        ],
                      );
            },
            childCount: 1
          ),
        ),

      ]
      
    );
  }
}
