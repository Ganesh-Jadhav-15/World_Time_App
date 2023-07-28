import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getTime();
  }

  void getTime() async {
    WorldTime createIn = WorldTime(
        flag: "America.png", location: "Salta", url: 'America/Argentina/Salta');
    await createIn.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': createIn.location,
      'flag': createIn.flag,
      'time': createIn.time,
      'isDay': createIn.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Center(
              child: SpinKitFoldingCube(
        color: Colors.white,
        size: 50.0,
      ))),
    );
  }
}
