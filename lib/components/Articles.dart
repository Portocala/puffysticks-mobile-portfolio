import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:puffysticks/objects/Article.dart';
import 'package:puffysticks/components/FocusedArticle.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class Articles extends StatefulWidget {

  final Function(dynamic activeId) notifyParent;
  Articles({Key key, this.notifyParent}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ArticlesState();

}

class ArticlesState extends State<Articles> {

  @override
  void initState() {
    super.initState();
  }

  Future<List<Article>> fetchArticles() async {
    final response = await http.get('http://puffysticks.com/api/articles.json');
    if(response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return List<Article>.generate(responseBody.length, (int i) {
        return Article.fromJson(responseBody[i]);
      });
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
    future: fetchArticles(),
    builder: (context, snapshot) {
      List<Article> articles = snapshot.data;
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:  1,
          childAspectRatio: 1.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        delegate: articles == null ?
              SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  return Container(
                    child: null,
                    decoration: BoxDecoration(
                      color: Color(0xFF111111),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0)
                      )
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  );
                }, childCount: 2,
              )
              : SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FocusedArticle(article: articles[i]),
                        )
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Stack(children: <Widget>[
                        Center(
                          child: Icon(
                            Icons.filter_hdr,
                            color: Colors.white60,
                          ),
                        ),
                        SizedBox.expand(
                          child: ClipRRect(
                            child: Image.network(
                              articles[i].images[0],
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        articles[i].forsale ? Positioned( 
                          child:
                            Container( 
                              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                              child: Text(
                                'for sale', 
                                style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w700, fontFamily: 'Muli'), 
                              ), 
                              decoration: BoxDecoration(
                                color:Color(0xBF000000),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0)
                                )
                              ),
                            ),
                          right: 10.0,
                          bottom: 10.0,
                        ) : Container(),
                      ],),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all( Radius.circular(10) ),
                      ),
                    ),
                  );
                }, childCount: articles.length
              ),
        );
      }
    );
  }

}