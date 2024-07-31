import 'package:bookly/features/home/presentation/manager/best_seller_books_cubit/best_seller_cubit.dart';
import 'package:bookly/features/home/presentation/manager/best_seller_books_cubit/best_seller_states.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerStates>(
      builder: (context, state) {
        if (state is BestSellerSuccess) {
          return SliverList.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: BestSellerItem(
                  image: state.data[index].items![index].volumeInfo!.imageLinks!
                      .thumbnail,
                  title: state.data[index].items![index].volumeInfo!.title,
                  author:
                      state.data[index].items![index].volumeInfo!.authors![0],
                  preview:
                      state.data[index].items![index].volumeInfo!.previewLink,
                ),
              );
            },
          );
        } else if (state is BestSellerFailed) {
          return SliverFillRemaining(
            child: Center(
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
          return const SliverToBoxAdapter(
            child: LinearProgressIndicator(),
          );
        }
      },
    );
  }
}
