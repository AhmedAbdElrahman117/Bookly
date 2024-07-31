import 'package:bookly/features/home/data/model/book_model/book_model.dart';

class FeaturedBooksStates {}

class FeaturedBookInitial extends FeaturedBooksStates {}

class FeaturedBookLoading extends FeaturedBooksStates {}

class FeaturedBookFailed extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBookFailed(this.errorMessage);
}

class FeaturedBookSuccess extends FeaturedBooksStates {
  final List<BookModel> data;

  FeaturedBookSuccess(this.data);
}
