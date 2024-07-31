import 'package:bookly/features/home/data/model/book_model/book_model.dart';

class BestSellerStates {}

class BestSellerInitial extends BestSellerStates {}

class BestSellerLoading extends BestSellerStates {}

class BestSellerFailed extends BestSellerStates {
  final String errorMessage;

  BestSellerFailed(this.errorMessage);
}

class BestSellerSuccess extends BestSellerStates {
  final List<BookModel> data;

  BestSellerSuccess(this.data);
}
