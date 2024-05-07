import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PNetworkImage extends StatelessWidget {
  final String? image;
  final BoxFit? fit;
  final double? width, height;
  const PNetworkImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Image.network(
    //   image!,
    //   // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    //   // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
    //   fit: fit,
    //   width: width,
    //   height: height,
    // );

    return CachedNetworkImage(
      imageUrl: image!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white10,
        child: Container(
            decoration: const BoxDecoration(
          color: Colors.amberAccent,
        )),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
