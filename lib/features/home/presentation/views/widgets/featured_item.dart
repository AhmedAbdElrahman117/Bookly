import 'package:bookly/core/utils/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, this.width, this.height, required this.data});

  final double? width;
  final double? height;
  final List<String?> data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.bookDetails, extra: data);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: height ?? MediaQuery.of(context).size.height * 0.25,
          width: width ?? MediaQuery.of(context).size.width * 0.35,
          child: CachedNetworkImage(
            imageUrl: data[0] ?? '',
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, progress) {
              return CircularProgressIndicator(
                value: progress.progress,
              );
            },
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
          ),
        ),
      ),
    );
  }
}

// Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//         alignment: Alignment.bottomRight,
//         height: height ?? MediaQuery.of(context).size.height * 0.25,
//         width: width ?? MediaQuery.of(context).size.width * 0.35,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: NetworkImage(
//               image!,
//             ),
//           ),
//         ),
//         child: IconButton.filledTonal(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.play_arrow,
//           ),
//         ),
//       ),