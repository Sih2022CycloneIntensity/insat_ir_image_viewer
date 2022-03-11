import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cyclone Prediction",
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  get selected => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Cyclone Prediction"
        ),
        centerTitle: true,
      ),
      body: Center(


        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Satellite :',
                style: DefaultTextStyle
                    .of(context)
                    .style,
                children: const <TextSpan>[
                  TextSpan(text: 'INSAT 3D-IMAGER',
                      style: TextStyle(fontWeight: FontWeight.bold,)),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(5.0),

              child: DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: "1",
                    child: Center(
                      child: Text("Full Disk"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "2",
                    child: Center(
                      child: Text("Asia Sector"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "3",
                    child: Center(
                      child: Text("Asia Sector High Resolution"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "4",
                    child: Center(
                      child: Text("Bay Of Bengal"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "5",
                    child: Center(
                      child: Text("Arabian Sea"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "6",
                    child: Center(
                      child: Text("Aviation Sector"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "7",
                    child: Center(
                      child: Text("Pilgrimage"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "8",
                    child: Center(
                      child: Text("Geophysical Products"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "9",
                    child: Center(
                      child: Text("Wind Derived Products"),
                    ),),

                  DropdownMenuItem<String>(
                    value: "10",
                    child: Center(
                      child: Text("Atomsphric Motion Vector"),
                    ),),

                  DropdownMenuItem<String>(
                    value: "11",
                    child: Center(
                      child: Text("Binned Daily"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "12",
                    child: Center(
                      child: Text("Binned Weekly"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "13",
                    child: Center(
                      child: Text("Binned Monthly"),
                    ),
                  ),

                ],
                onChanged: (_value) =>
                {
                  print(_value.toString()),

                },
                hint: Text(
                    "Select the product"
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(5.0),
              child: DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: "1",
                    child: Center(
                      child: Text("OLR Weekly"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "2",
                    child: Center(
                      child: Text("SST Weekly (since Feb 2021)"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "3",
                    child: Center(
                      child: Text("SST Weekly"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "4",
                    child: Center(
                      child: Text("UTH Weekly"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "5",
                    child: Center(
                      child: Text("HEM Weekly"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "6",
                    child: Center(
                      child: Text("GPI Weekly"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "7",
                    child: Center(
                      child: Text("IMR Weekly"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "8",
                    child: Center(
                      child: Text("IMC Weekly"),
                    ),),
                  DropdownMenuItem<String>(
                    value: "9",
                    child: Center(
                      child: Text("MIR_TEMP_WEEKLY"),
                    ),),

                  DropdownMenuItem<String>(
                    value: "10",
                    child: Center(
                      child: Text("WV__TEMP_WEEKLY"),
                    ),),

                  DropdownMenuItem<String>(
                    value: "11",
                    child: Center(
                      child: Text("IR1_TEMP_WEEKLY"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "12",
                    child: Center(
                      child: Text("IR2_TEMP_WEEKLY"),
                    ),
                  ),


                ],
                onChanged: (_value) =>
                {
                  print(_value.toString()),

                },
                hint: Text(
                    "Select the Layer"
                ),
              ),
            ),


            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text("Choose Date"),
            ),
            Text("${selectedDate.day}/${selectedDate.month}/${selectedDate
                .year}")
          ],
        ),
      ),


    );
  }
    _selectDate(BuildContext context) async {
      showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
        helpText: "SELECT DATE",
        cancelText: "CANCEL",
        confirmText: "SELECT NOW",
        fieldHintText: "DATE/MONTH/YEAR",
        fieldLabelText: "SELECT DATE",
      );
      if (selected != null && selected != selectedDate)
        setState(() {
          selectedDate = selected;
        });
    }
  }


