import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = data['isDay'] ? 'assets/day1.png' : 'assets/night2.png';
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () async {
                    // dynamic result =
                    //     await Navigator.pushNamed(context, '/location');
                    // print(result);
                    // setState(() {
                    //   data = {
                    //     "time": result['time'],
                    //     "location": result['location'],
                    //     "isDay": result['isDay'],
                    //     "flag": result['flag']
                    //   };
                    // }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[800],
                  ),
                  label: Text("Edit Location",
                      style: TextStyle(color: Colors.grey[800]))),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 20.0, letterSpacing: 2.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 55.0, letterSpacing: 2.0),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
