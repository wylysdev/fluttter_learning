import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.fadeTitle,
      ],
      collapseMode: CollapseMode.parallax,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 60,
          child: TextField(
            
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.purple,),
                alignLabelWithHint: false,
                labelText: "Pesquise algo...",
                labelStyle: TextStyle(fontSize: 16.0),
                filled: true,
                border: InputBorder.none,
                fillColor: Colors.white),
          ),
        ),
      ),
      background: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "images/background-app-bar.jpg",
            fit: BoxFit.cover,
          ),
          DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.purple.withOpacity(0.5),
            ],
          )))
        ],
      ),
    );
  }
}
