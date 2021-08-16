import 'package:flutter/material.dart';

/* 

  Atentar-se quando usar [Function] em colocar dentro de arrow function
  (){
    aqui_vem_a_function
  }

 */

class Count extends StatelessWidget {
  final int count;
  final VoidCallback? onCountSelected;

  /// Formato de declaração
  final Function(int a) onCountChanged;

  Count({
    required this.count,
    required this.onCountSelected,
    required this.onCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MouseRegion(
          // onEnter: (a) {
          //   print("Opa");
          //   onCountChanged(1);
          // },
          child: TextButton(
            onPressed: () {
              onCountChanged(1);
            },
            child: Icon(Icons.add),
          ),
        ),
        TextButton(onPressed: onCountSelected, child: Text("COUNT $count")),
        MouseRegion(
          // onEnter: (a) {
          //   print("Opa");
          //   onCountChanged(-1);
          // },
          child: TextButton(
            onPressed: () {
              onCountChanged(-1);
            },
            child: Icon(Icons.remove),
          ),
        ),
      ],
    );
  }
}
