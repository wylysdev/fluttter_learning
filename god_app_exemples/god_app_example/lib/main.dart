import 'package:flutter/material.dart';
import 'package:god_app_example/comom/widgets/AppBarCustom/app_bar_custom.dart';

import 'comom/widgets/PageModel/page_model_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.4,
            backgroundColor: Colors.purple,
            collapsedHeight: 80.0,
            toolbarHeight: 80.0,
            centerTitle: true,
            stretch: true,
            pinned: true,
            flexibleSpace: AppBarCustom(),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: [
                PageModelWidget(
                  index: 1,
                  namePage: "Uso de funções callback",
                  onPressed: () {
                    print("Cliquei");
                  },
                ),
                PageModelWidget(
                  index: 1,
                  namePage: "Exemplo... ",
                ),
                PageModelWidget(
                  index: 1,
                  namePage: "Exemplo... ",
                ),
                PageModelWidget(
                  index: 1,
                  namePage: "Exemplo... ",
                ),
                PageModelWidget(
                  index: 1,
                  namePage: "Exemplo... ",
                ),
                PageModelWidget(
                  index: 1,
                  namePage: "Exemplo... ",
                ),
                PageModelWidget(
                  index: 1,
                  namePage: "Exemplo... ",
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
