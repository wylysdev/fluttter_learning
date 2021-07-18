import 'package:flutter/material.dart';

class PageModelWidget extends StatefulWidget {
  final String namePage;
  final int index;
  final VoidCallback? onPressed;
  PageModelWidget({
    Key? key,
    required this.namePage,
    required this.index,
    this.onPressed,
  }) : super(key: key);

  @override
  _PageModelWidgetState createState() => _PageModelWidgetState();
}

class _PageModelWidgetState extends State<PageModelWidget> {
  double sizeText({
    required double max,
    required double min,
    required BuildContext context,
  }) {
    var size = MediaQuery.of(context).size;
    var valueOfWidth = size.width * 0.15;

    if (valueOfWidth > min && valueOfWidth < max) {
      print("variavel");
      return valueOfWidth;
    } else if (valueOfWidth > max) {
      print("menor q max");
      return max;
    } else {
      return min;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed ?? null,
      child: DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.w800,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Image.asset(
                "images/dog.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.purple,
                      Colors.primaries[widget.index].withAlpha(150),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16.0)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.namePage}${sizeText(context: context, max: 18.0, min: 1.0)}",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
