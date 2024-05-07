import 'package:flutter/material.dart';
import 'package:recipe_app/src/core/functions/network_image.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';

class Sample2 extends StatelessWidget {
  const Sample2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.bgColor,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                expandedHeight: 250,
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => ListTile(
                  title: Text("Index: $index"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: 500,
          color: AppColors.bgColor,
          margin: const EdgeInsets.only(top: 10, left: 16),
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  height: 46,
                  width: 46,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const PNetworkImage(
                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text("Food", style: TextTypography.mH1),
              ],
            ),
          ),
        ),
        Positioned(
          //top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const PNetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
