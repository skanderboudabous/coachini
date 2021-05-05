import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
class OnlineImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  OnlineImage(this.url,{this.width,this.height});
  @override
  Widget build(BuildContext context) {
    return  ExtendedImage.network(
      this.url!,
      width: width??50,
      height: height??50,
      fit: BoxFit.fill,
      cache: true,
      shape: BoxShape.circle,
    );
  }
}
