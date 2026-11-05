import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.contain,
  });

  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final cacheWidth =
            constraints.maxWidth.isFinite && constraints.maxWidth > 0
            ? (constraints.maxWidth * devicePixelRatio).round()
            : null;
        return Image.network(
          imageUrl,
          fit: fit,
          cacheWidth: cacheWidth,
        );
      },
    );
  }
}
