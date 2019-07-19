import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatefulWidget {

  final String url;
  final Function(bool back) notifyParent;
  FullScreenImage({Key key, @required this.url, this.notifyParent}) : super(key: key);

  State<StatefulWidget> createState() => FullScreenImageState();

}

class FullScreenImageState extends State<FullScreenImage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// [queryData] device data
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Material( 
      child: Container(
        child: PhotoView(
          imageProvider: NetworkImage(widget.url),
          maxScale: 2.0,
          minScale: 0.5,
        ),
        width: queryData.size.width,
        height: queryData.size.height,
        padding: EdgeInsets.only(top: 25),
        color: Colors.black,
      ) 
    );
  }

}