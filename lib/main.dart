import 'package:flutter/material.dart';
import 'package:puffysticks/components/Contact.dart';
import 'package:puffysticks/components/Filters.dart';
import 'package:puffysticks/components/Articles.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primaryColor: Color(0xFF8E3BEB),
    ),
    debugShowCheckedModeBanner: false,
  )
);

class MyApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    return Material( 
      child: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Contact(),
                    Filters(),
                  ]),
                ),
                Articles(),
              ],
            ),
          ],
        ),
      )
    );
  }

}