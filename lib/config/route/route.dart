import 'package:kitten_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:kitten_app/domain/models/cat_details.dart';

final appRouter = GoRouter(
    initialLocation: '/home/0',
    routes: [

      GoRoute(
          path: '/home/:page',
          name: HomeScreen.name,
          builder: (context, state) {
            return const HomeScreen();
          },
          routes: [
            GoRoute(
              path: 'cat',
              name: CatScreen.name,
              builder: (context, state) {
                final CatDetails catDetails = state.extra as CatDetails;

                return CatScreen(catDetails: catDetails);
              },
            ),
          ]
      ),



      GoRoute(
        path: '/',
        redirect: ( _ , __ ) => '/home/0',
      ),

    ]
);