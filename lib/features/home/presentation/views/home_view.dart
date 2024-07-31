import 'package:bookly/constant.dart';
import 'package:bookly/core/utils/routes.dart';
import 'package:bookly/features/home/presentation/manager/best_seller_books_cubit/best_seller_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<FeaturedBooksCubit>(context).getFeaturedBooks();
    BlocProvider.of<BestSellerCubit>(context).getBestSellerBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Image.asset(
          kLogo,
          scale: 1.2,
        ),
        titleSpacing: 25,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 25,
            ),
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).push(Routes.search);
              },
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
