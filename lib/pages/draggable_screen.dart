import 'package:flutter/material.dart';


class DraggableScreen extends StatefulWidget {

  const DraggableScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DraggableScreen> createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  int acceptedData = 0;
  String statement = "";
  String secondStatement = "";

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Draggable',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: mq.padding.top,
          bottom: mq.padding.bottom,
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            Draggable<String>(
              data: 'First',
              child: Text('Hello'),
              feedback: Container(
                height: 30,
                width: 30,
                color: Colors.red,
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              childWhenDragging: Container(
                height: 30,
                width: 30,
                color: Colors.grey,
              ),
            ),

            Draggable<String>(
              data: 'Second',
              child: Text('Hi'),
              feedback: Container(
                height: 30,
                width: 30,
                color: Colors.red,
                child: Text(
                  'Hi',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              childWhenDragging: Container(
                height: 30,
                width: 30,
                color: Colors.grey,
              ),
            ),

            DragTarget<String>(
              builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                  ) {
                return Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.cyan,
                  child: Center(
                    child: Text(statement),
                  ),
                );
              },
              onAccept: (String data) {
                setState(() {
                  statement = data;
                });
              },
            ),


            DragTarget<String>(
              builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                  ) {
                return Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.cyan,
                  child: Center(
                    child: Text(secondStatement),
                  ),
                );
              },
              onAccept: (String data) {
                setState(() {
                  secondStatement = data;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
