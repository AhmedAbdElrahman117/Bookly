import 'package:bookly/core/utils/failures.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/get_books.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await GetBooks().get(
          URL:
              'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest');
      List<BookModel> books = [];

      for (var i = 0; i < data.length; i++) {
        books.add(BookModel.fromJson(data));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(DioFailed.fromError(e));
      } else {
        return left(DioFailed(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await GetBooks().get(
          URL:
              'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books = [];

      for (var i = 0; i < data.length; i++) {
        books.add(BookModel.fromJson(data));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(DioFailed.fromError(e));
      } else {
        return left(DioFailed(e.toString()));
      }
    }
  }
}
