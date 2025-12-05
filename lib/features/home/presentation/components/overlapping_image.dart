import 'package:flutter/material.dart';

class OverlappingAvatars extends StatelessWidget {
  final List<String> images; // list of image paths or URLs
  final double radius;
  final double overlap; // how much they overlap

  const OverlappingAvatars({
    super.key,
    required this.images,
    this.radius = 16,
    this.overlap = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < images.length; i++)
            Positioned(
              left: i * overlap,
              child: CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage(images[i]),
              ),
            )
        ],
      ),
    );
  }
}
