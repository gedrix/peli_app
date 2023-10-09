import 'package:cloncines/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';



final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/', 
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'movie/:id', 
            name: MovieScreen.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-ud';
              return MovieScreen(movieId: movieId);
            },

          ),
        ]
      ),

      
  ]
);