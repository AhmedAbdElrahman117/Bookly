import 'package:bookly/features/home/presentation/views/widgets/featured_listview.dart';
import 'package:flutter/material.dart';

class BookSuggest extends StatelessWidget {
  const BookSuggest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'you may also like',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: FeaturedListview(
            width: 120,
            height: 70,
          ),
        ),
      ],
    );
  }
}
