import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/home/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const home = '/homeView';
  static const bookDetails = '/bookDetails';
  static const search = '/search';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: bookDetails,
        builder: (context, state) {
          return BookDetailsView(
            data: state.extra as List<String?>,
          );
        },
      ),
      GoRoute(
        path: search,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
