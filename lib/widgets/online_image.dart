import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class OnlineImage extends StatefulWidget {
  final String? url;
  final double? width;
  final double? height;
  final double? size;

  OnlineImage(this.url, {this.width, this.height,this.size});

  @override
  _OnlineImageState createState() => _OnlineImageState();
}

class _OnlineImageState extends State<OnlineImage>
    with SingleTickerProviderStateMixin {
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
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return widget.url != null
        ? ExtendedImage.network(
            this.widget.url!,
            width: this.widget.width ?? 50,
            height: this.widget.height ?? 50,
            fit: BoxFit.cover,
            cache: true,
            enableMemoryCache: true,
            shape: BoxShape.circle,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            enableLoadState: true,
            handleLoadingProgress: true,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  _controller.reset();
                  return CircularProgressIndicator();
                case LoadState.completed:
                  _controller.forward();
                  return FadeTransition(
                      opacity: _controller,
                      child: CircleAvatar(
                        minRadius: widget.size??20,
                        maxRadius: widget.size??20,
                        backgroundImage:state.imageProvider ,
                      ));
                 // break;
                case LoadState.failed:
                  _controller.reset();
                  return GestureDetector(
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle_outlined,
                          size: 50,
                        ),
                      ],
                    ),
                    onTap: () {
                      state.reLoadImage();
                    },
                  );
              }
            },
          )
        : Icon(
            Icons.supervised_user_circle,
            size: 30,
          );
  }
}
