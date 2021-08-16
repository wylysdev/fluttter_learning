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
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 300.0,
          ),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 30,
          child: TextField(
            textAlign: TextAlign.justify,
            textAlignVertical: TextAlignVertical.bottom,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.purple,
                ),
                hintTextDirection: TextDirection.ltr,
                hintMaxLines: 1,
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(15),
                hintText: "Pesquise pelo o portifólio",
                hintStyle: TextStyle(
                  fontSize: 10.0,
                ),
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
