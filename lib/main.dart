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
  Color passedColor = Colors.transparent;
  Color initialStarColor = Colors.yellow;
  bool isRedDraggable = true;
  bool isGreenDraggable = false;
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
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  MyBox(
                    backgroundColor: Colors.red,
                    child: isRedDraggable
                        ? Draggable<Color>(
                            data: Colors.yellow,
                            feedback: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 150,
                            ),
                            childWhenDragging: SizedBox(),
                            child: Icon(
                              Icons.star,
                              color: initialStarColor,
                              size: 150,
                            ))
                        : DragTarget<Color>(
                            onAccept: (data) => setState(() {
                                  initialStarColor = data;
                                  passedColor = Colors.transparent;
                                  isRedDraggable = true;
                                  isGreenDraggable = false;
                                }),
                            builder: (context, _, __) {
                              return Icon(
                                Icons.star,
                                color: initialStarColor,
                                size: 150,
                              );
                            }),
                  ),
                  MyBox(
                    backgroundColor: Colors.grey,
                  ),
                  MyBox(
                    backgroundColor: Colors.grey,
                  ),
                  MyBox(
                      backgroundColor: Colors.lightGreen,
                      child: isGreenDraggable
                          ? Draggable<Color>(
                              data: Colors.yellow,
                              feedback: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 150,
                              ),
                              childWhenDragging: SizedBox(),
                              child: Icon(
                                Icons.star,
                                color: passedColor,
                                size: 150,
                              ))
                          : DragTarget<Color>(
                              onAccept: (data) => setState(() {
                                    passedColor = data;
                                    initialStarColor = Colors.transparent;
                                    isRedDraggable = false;
                                    isGreenDraggable = true;
                                  }),
                              builder: (context, _, __) {
                                return Icon(
                                  Icons.star,
                                  color: passedColor,
                                  size: 150,
                                );
                              }))
                ],
              ),
            )
          ],
        ));
  }
}

class MyBox extends StatelessWidget {
  final Color backgroundColor;
  final Widget? child;
  const MyBox({Key? key, required this.backgroundColor, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
      height: 140,
      color: backgroundColor,
      margin: EdgeInsets.all(5),
      child: child ?? SizedBox(),
    );
  }
}
