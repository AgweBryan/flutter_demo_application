import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double top = 10;
  double left = 5;
  double draggingX = 0;
  double draggingY = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo App"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(25),
              height: MediaQuery.of(context).size.height * .5,
              width: double.infinity,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  print("Entered this function!");
                  if (draggingX > -7 &&
                      draggingX < 27 &&
                      draggingY > -5 &&
                      draggingY < 29) {
                    setState(() {
                      top = 10;
                      left = 5;
                    });
                  } else if (draggingX > 166 &&
                      draggingX < 207 &&
                      draggingY > 166 &&
                      draggingY < 215) {
                    setState(() {
                      top = 181;
                      left = 181;
                    });
                  } else {
                    setState(() {
                      top = 10;
                      left = 5;
                    });
                  }
                },
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    draggingY = details.localPosition.dy;
                    draggingX = details.localPosition.dx;
                    top = details.localPosition.dy;
                    left = details.localPosition.dx;
                  });
                },
                child: Stack(children: [
                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: const [
                      MyBox(
                        backgroundColor: Colors.red,
                      ),
                      MyBox(
                        backgroundColor: Colors.grey,
                      ),
                      MyBox(
                        backgroundColor: Colors.grey,
                      ),
                      MyBox(
                        backgroundColor: Colors.lightGreen,
                      )
                    ],
                  ),
                  Positioned(
                    // top: 10,
                    // left: 5,
                    // top: 185,
                    // left: 185,
                    top: top,
                    left: left,
                    child: Icon(
                      Icons.star,
                      size: 150,
                      color: Colors.yellow,
                    ),
                  )
                ]),
              ),
            )
          ],
        ));
  }
}

class MyBox extends StatelessWidget {
  final Color backgroundColor;
  const MyBox({Key? key, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
      height: 140,
      color: backgroundColor,
      margin: EdgeInsets.all(5),
    );
  }
}
