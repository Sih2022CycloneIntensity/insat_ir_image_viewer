import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insat_ir_image_viewer/movable_card.dart';
import 'package:insat_ir_image_viewer/navbar.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cyclone Prediction",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  Image curImg = Image.asset('images/image.jpg',fit: BoxFit.cover);
  void loadData() async{
    final ByteData imageData = await NetworkAssetBundle(Uri.parse("YOUR_URL")).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    curImg = Image.memory(bytes,fit: BoxFit.cover,);
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(minutes: 30), (Timer t) => loadData());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Cyclone Prediction'),
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [curImg,MovableStackItem()],
        ),
      ),
    );
  }
}



