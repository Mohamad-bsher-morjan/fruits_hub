import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
  });

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('تخطي'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
