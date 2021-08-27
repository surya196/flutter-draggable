import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Widgets(),
    );
  }
}

class Widgets extends StatefulWidget {
  const Widgets({Key? key}) : super(key: key);

  @override
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  Color color1 = Colors.red;
  Color color2 = Colors.yellow;
  Color? color3;
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('  SizedBox '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Draggable<Color>(
                data: color1,
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: Material(
                    child: Text('Draggable SizedBox'),
                    elevation: 4,
                    shape: StadiumBorder(),
                    color: color1,
                  ),
                ),
                feedback: SizedBox(
                  width: 150,
                  height: 50,
                  child: Material(
                    elevation: 4,
                    shape: StadiumBorder(),
                    color: color2.withOpacity(.3),
                  ),
                ),
              ),
            ],
          ),
          DragTarget<Color>(
              onWillAccept: (val) => true,
              onAccept: (val) {
                isAccepted = true;
                color3 = val;
              },
              builder: (context, canditates, rejected) {
                return (isAccepted)
                    ? SizedBox(
                        width: 250,
                        height: 150,
                        child: Material(
                          shape: StadiumBorder(),
                          color: color3,
                        ),
                      )
                    : SizedBox(
                        width: 250,
                        height: 150,
                        child: Material(
                          shape: StadiumBorder(),
                          color: Colors.black26,
                        ),
                      );
              })
        ],
      ),
    );
  }
}
