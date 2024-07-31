import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BestSellerRate extends StatelessWidget {
  const BestSellerRate({super.key, this.align = MainAxisAlignment.start});
  final MainAxisAlignment align;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: const [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellowAccent,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '4.9',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '(2030)',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
