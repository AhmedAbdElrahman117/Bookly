import 'package:bookly/features/home/presentation/views/widgets/best_seller_rate.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_suggest.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.data});

  final List<String?> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(data[0]!),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          maxLines: 2,
          textAlign: TextAlign.center,
          data[1]!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          data[2]!,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BestSellerRate(
          align: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {},
              backGroundColor: Colors.white,
              text: '19.99\$',
              topLeft: 15,
              bottomLeft: 15,
            ),
            const SizedBox(
              width: 1,
            ),
            CustomButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(data[3]!),
                );
              },
              backGroundColor: const Color(0xffEF8262),
              text: AvilableBook(),
              topRight: 15,
              bottomRight: 15,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        BookSuggest(),
      ],
    );
  }

  launchURL(Uri link) async {
    await launchUrl(
      link,
      mode: LaunchMode.platformDefault,
    );
  }

  AvilableBook() {
    if (data[3] != null) {
      return 'Preview';
    } else {
      return 'Not Available';
    }
  }
}
