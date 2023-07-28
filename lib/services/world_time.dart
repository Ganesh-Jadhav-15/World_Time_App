import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String time = "";
  String flag;
  String url;
  String location;
  bool isDay = false;

  WorldTime({required this.flag, required this.location, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      DateTime now = DateTime.parse(dateTime);
      time = DateFormat.jm().format(now);
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print(e);
      time = "Could not able to get time";
    }
  }
}
