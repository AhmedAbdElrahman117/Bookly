import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/best_seller_books_cubit/best_seller_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerCubit extends Cubit<BestSellerStates> {
  BestSellerCubit() : super(BestSellerInitial());

  getBestSellerBooks() async {
    emit(BestSellerLoading());

    var res = await HomeRepoImpl().fetchBestSellerBooks();
    res.fold(
      (l) => emit(
        BestSellerFailed(l.errorMessage),
      ),
      (r) => emit(
        BestSellerSuccess(r),
      ),
    );
  }
}
