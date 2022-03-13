import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:insat_ir_image_viewer/movable_card.dart';
import 'package:insat_ir_image_viewer/navbar.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cyclone Prediction",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;
  String category = 'processing!';
  String getTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(now);
    return formattedDate;
  }

  Image curImg = Image.asset('images/image.jpg', fit: BoxFit.cover);
  Future getData(url) async {
    Response response = await get(url, headers: {
      "Access-Control_Allow_Origin": "*",
      "Access-Control-Allow-Methods": "GET",
    });
    return response.body;
  }

  void loadData() async {
    Uri url = Uri.parse('http://127.0.0.1:5000/');
    var data = await getData(url);
    var imageStr = jsonDecode(data)["img"].toString();
    setState(() {
      curImg = Image.memory(
        base64Decode(imageStr),
        fit: BoxFit.contain,
      );
      category = jsonDecode(data)["cat"].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
    timer = Timer.periodic(const Duration(minutes: 30), (Timer t) => loadData());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.refresh,
                  size: 26.0,
                ),
              ),
          ),
        ],
        title: Text('Cyclone Prediction'),
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            curImg,
            MovableStackItem(
              category: category,
              curTime: getTime(),
            )
          ],
        ),
      ),
    );
  }
}


