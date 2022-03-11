import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _dateCount;
  late String _range;
  late DateTime _startDate ;
  late DateTime _endDate ;
  void initState() {
    _dateCount = '';
    _range = 'Empty';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      setState(() {
        if (args.value is PickerDateRange) {
          // _startDate=DateFormat('dd/MM/yyyy').format(args.value.startDate) as DateFormat;
          // _endDate = DateFormat('dd/MM/yyyy').format(args.value.endDate) as DateFormat;
          _startDate= args.value.startDate;
          _endDate = args.value.endDate;
          _range =
              DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                  ' - ' +
                  DateFormat('dd/MM/yyyy')
                      .format(args.value.endDate ?? args.value.startDate)
                      .toString();
          print('start date : $_startDate');
          print('end date : $_endDate');
        } else if (args.value is DateTime) {
        } else if (args.value is List<DateTime>) {
          _dateCount = args.value.length.toString();
        }
      });
    }
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('$_range'),
        ),
        body: Container(
          child:SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 4)),
                DateTime.now().add(const Duration(days: 3))),
          ),
        ),
      ),
    );
  }
}

