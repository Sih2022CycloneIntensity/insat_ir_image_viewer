import 'package:flutter/material.dart';

class MovableStackItem extends StatefulWidget {
   String curTime;
   String category;
  MovableStackItem({required this.curTime,required this.category});
  @override
  _MovableStackItemState createState() => _MovableStackItemState();
}

class _MovableStackItemState extends State<MovableStackItem> {
  double _xPosition = 25;
  double _yPosition = 50;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _yPosition,
      left: _xPosition,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          setState(() {
            _xPosition += tapInfo.delta.dx;
            _yPosition += tapInfo.delta.dy;
          });
        },
        child: Container(
          height: 200,
          width: 200,
          child: Card(
            child: Column(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ListTile(
                    title: Text("Date and time : ${widget.curTime}"),
                ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Category : ${widget.category}"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {

                    });
                  },
                  child: Text('Refresh'),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(20, 10), primary: Colors.deepOrange),
                )
              ],
            ),
            elevation: 8,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(20),
          ),
        )
      ),
    );
  }
}

