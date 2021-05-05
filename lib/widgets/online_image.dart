import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
class OnlineImage extends StatefulWidget {
  final String? url;
  final double? width;
  final double? height;
  OnlineImage(this.url,{this.width,this.height});
  @override
  _OnlineImageState createState() => _OnlineImageState();
}

class _OnlineImageState extends State<OnlineImage> with SingleTickerProviderStateMixin {


  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: 0.0,
        upperBound: 1.0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ExtendedImage.network(
      this.widget.url!,
      width: this.widget.width??50,
      height: this.widget.height??50,
      fit: BoxFit.fill,
      cache: true,
      enableMemoryCache: true,
      shape: BoxShape.circle,
      enableLoadState: true,
      handleLoadingProgress: true,
      loadStateChanged: (ExtendedImageState state){
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            _controller.reset();
            return CircularProgressIndicator();
          case LoadState.completed:
            _controller.forward();
            return FadeTransition(
              opacity: _controller,
              child: ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                width: 50,
                height: 50,
              ),
            );
            break;
          case LoadState.failed:
            _controller.reset();
            return GestureDetector(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Icon(Icons.account_circle_outlined,size: 50,),
                ],
              ),
              onTap: () {
                state.reLoadImage();
              },
            );
            break;
        }
      },
    );
  }
}
