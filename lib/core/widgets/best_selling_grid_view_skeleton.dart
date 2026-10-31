import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewSkeleton extends StatelessWidget {
  const BestSellingGridViewSkeleton({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 231,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => const _FruitItemSkeleton(),
    );
  }
}

class _FruitItemSkeleton extends StatelessWidget {
  const _FruitItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xfff3f5f7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: 8,
            top: 8,
            child: Bone.circle(size: 24),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Bone(
                        width: 96,
                        height: 96,
                        uniRadius: 48,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Bone(
                              width: double.infinity,
                              height: 16,
                              uniRadius: 4,
                            ),
                            SizedBox(height: 8),
                            Bone(width: 80, height: 13, uniRadius: 4),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Bone.circle(size: 32),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
