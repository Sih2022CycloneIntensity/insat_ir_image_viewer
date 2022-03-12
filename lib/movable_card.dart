import 'package:flutter/material.dart';

class MovableStackItem extends StatefulWidget {
  @override
  _MovableStackItemState createState() =>
      _MovableStackItemState(color: Colors.red);
}

class _MovableStackItemState extends State<MovableStackItem> {
  double _xPosition = 25;
  double _yPosition = 50;
  final Color color;

  _MovableStackItemState({required this.color});

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
                const ListTile(
                  title: Text("Date and time : "),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text('Refresh'))
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