import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit() : super(FeaturedBookInitial());
  getFeaturedBooks() async {
    emit(FeaturedBookLoading());

    var res = await HomeRepoImpl().fetchBestSellerBooks();
    res.fold(
      (l) => emit(FeaturedBookFailed(l.errorMessage)),
      (r) => emit(FeaturedBookSuccess(r)),
    );
  }
}
