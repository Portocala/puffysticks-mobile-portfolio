import 'package:flutter/material.dart';
import 'package:puffysticks/objects/Article.dart';
import 'package:puffysticks/components/FullScreenImage.dart';

class FocusedArticle extends StatefulWidget {

  final Article article; 
  final Function(bool fs) notifyParent;
  FocusedArticle({Key key, @required this.article, this.notifyParent}) : super(key: key);

  State<StatefulWidget> createState() => FocusedArticleState();

}

class FocusedArticleState extends State<FocusedArticle> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material( 
      child: widget.article.title != null ? Container(color: Colors.black, child: ListView(
          children: <Widget>[
          Container(
            child: Text(
              widget.article.title,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 40.0, 
                fontWeight: FontWeight.w900, 
                fontFamily: 'Muli'
              )
            ),
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
          ),
          Container(
            child: Wrap(
              spacing: 20,
              direction: Axis.horizontal,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Text(
                      'go back',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 20.0, 
                        fontWeight: FontWeight.w700, 
                        fontFamily: 'Muli'
                      )
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white,),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(url: widget.article.images.length == 2 ? widget.article.images[1] : widget.article.images[0]),
                      )
                    );
                  },
                  child: Container(
                    child: Text(
                      'full image',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 20.0, 
                        fontWeight: FontWeight.w700, 
                        fontFamily: 'Muli'
                      )
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white,),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  ),
                ),
              ],
            ),
            margin: ( widget.article.desc.isNotEmpty ) ? EdgeInsets.all(20) : EdgeInsets.fromLTRB(20, 20, 20, 50),
          ),
          ( widget.article.desc.isNotEmpty ) ? Container(
            child: Text(
              widget.article.desc,
              style: TextStyle(
                color: Colors.black, 
                fontSize: 20.0, 
                fontWeight: FontWeight.w700, 
                fontFamily: 'Muli'
              )
            ),
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
          ) : Container(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImage(url: widget.article.images.length == 2 ? widget.article.images[1] : widget.article.images[0]),
                )
              );
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.article.images.length == 2 ? widget.article.images[1] : widget.article.images[0]) 
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(bottom: 20)
            )
          ),
        ]
      )) : Container() 
    );
  }

}