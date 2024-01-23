import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  const CustomImage(
      {Key? key,
        required this.image,
        this.height,
        this.width,
        this.fit = BoxFit.cover,
        this.placeholder,
        this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Image.asset(
          placeholder ?? Assets.png.placeholder.path,
          height: height,
          width: width,
          fit: BoxFit.cover),
      imageUrl: '$image',
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      errorWidget: errorWidget ??
              (c, o, s) => Image.asset(placeholder ?? Assets.png.placeholder.path,
              height: height, width: width, fit: BoxFit.cover),
    );
  }
}
