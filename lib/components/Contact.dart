import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import '../objects/SocialLink.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
    // social links
    final List<SocialLink> social = [
      SocialLink("facebook", "https://fb.me/puffysticks", Color(0xff3b5998)),
      SocialLink("twitter", "https://twitter.com/puffysticks", Color(0xff1da1f2)),
      SocialLink("instagram", "https://instagram.com/puffystickscom", Color(0xffe1306c)),
    ];

    /// opens an url through browser or app
    /// [@param] String [url] - link to open
    void _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    @override
    Widget build(BuildContext context) {
      /// [queryData] device data
      MediaQueryData queryData;
      queryData = MediaQuery.of(context);
      
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30,),
        child: 
        Column(
          children: <Widget>[
            Row(children: <Widget>[
              /// [Animated icon]
              Animator(
                tweenMap: {
                  "rotate": Tween<double>(begin: 0.05, end: 0.35),
                  "opacity": Tween<double>(begin: 0, end: 1)
                },
                duration: Duration(milliseconds: 1450),
                cycles: 0,
                curve: Curves.elasticOut,
                builderMap: (anim) => Transform.rotate(
                  child: Container(
                    child: Image.asset('assets/images/thumbs_up.png', height: 50,),
                    padding: EdgeInsets.only(left: 30, top: 40,)
                  ),
                  angle: anim['rotate'].value
                ),
              ),
              /// [Text]
              Container(
                padding: EdgeInsets.fromLTRB(10, 60, 0, 20),
                width: 200,
                child: Text(
                  'get in touch with us',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 30.0, 
                    fontWeight: FontWeight.w900, 
                    fontFamily: 'Muli'
                  ), 
                )
              )
            ],),
            /// [Social links list]
            Container(
              width: queryData.size.width,
              child: Wrap(
                spacing: 7,
                direction: Axis.horizontal,
                children:
                  List<Widget>.generate(social.length, (int i) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _launchURL(social[i].link),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: null,
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: social[i].color,
                                shape: BoxShape.circle,
                              ),
                              margin: EdgeInsets.only(top: 2,),
                            ),
                            Text(
                              social[i].name, 
                              style: TextStyle(
                                color: Colors.white, 
                                fontFamily: 'Muli', 
                                fontSize: 24.0, 
                                fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ), 
                        width: social[i].name.length * 16.0,
                      )
                    );
                  }),
              )
            )
        ])
      );
    }
}