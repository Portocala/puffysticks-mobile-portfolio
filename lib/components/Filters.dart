import 'package:flutter/material.dart';

class Filters extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => FiltersState();

}

class FiltersState extends State<Filters> {

  int _activeId = 0;
  // filters
  List<String> filters = ["all", "logos", "webdesign", "ipb themes", "illustrations & drawing", "for sale"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Wrap(
        children: 
          List<Widget>.generate(filters.length, (int i) {
            return Container(
              margin: EdgeInsets.only(right: 15, bottom: 7,),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                filters[i], 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700, 
                  fontFamily: 'Muli',
                  fontSize: 20,
                )
              ),
              decoration: i == _activeId ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                  colors: [
                    Color(0xFF8E3BEB),
                    Color(0xFFF23663)
                  ]
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
                ),
                boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0xFF8E3BEB),
                  blurRadius: 10.0,
                ),
              ])
              : null,
            );
          }),
      )
    );
  }

}