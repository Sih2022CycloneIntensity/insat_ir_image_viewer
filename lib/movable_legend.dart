import 'package:flutter/material.dart';

class MovableLegend extends StatefulWidget {
  @override
  _MovableLegendState createState() => _MovableLegendState();
}

class _MovableLegendState extends State<MovableLegend> {
  double _xPosition = 25;
  double _yPosition = 235;
ListTile customListTile({required String cat,required String Def}){
  return ListTile(

    leading: Text(cat,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold ),),
    title: Text(Def),
  );
}
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
            height: 500,
            width: 250,
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Legend',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 30),)),
                  ),
                  customListTile(cat: '0', Def: 'No Cyclone'),
                  // customListTile(cat: '1', Def: 'Deep Depression'),
                  customListTile(cat: '1', Def: 'Depression'),
                  customListTile(cat: '2', Def: 'Tropical Storm'),
                  customListTile(cat: '3', Def: 'Category One'),
                  customListTile(cat: '4', Def: 'Category Two'),
                  customListTile(cat: '5', Def: 'Category Three'),
                  customListTile(cat: '6', Def: 'Category Four'),
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

