import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_states.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedListview extends StatelessWidget {
  const FeaturedListview({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 4, top: 24, bottom: 24),
                  child: FeaturedItem(
                    data: [
                      state.data[index].items![index].volumeInfo!.imageLinks!
                          .thumbnail,
                      state.data[index].items![index].volumeInfo!.title,
                      state.data[index].items![index].volumeInfo!.authors![0],
                      state.data[index].items![index].volumeInfo!.previewLink,
                    ],
                    height: height,
                    width: width,
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookFailed) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        } else {
          return SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.blue,
              highlightColor: Colors.white,
              child: const Text(
                'Loading',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
