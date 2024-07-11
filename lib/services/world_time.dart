import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart'; // for readable time

class WorldTime {
  String location;
  String time = "";
  String flag = ""; // url to asset flag
  String url = "";
  bool isDaytime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse(('http://worldtimeapi.org/api/timezone/$url')));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String offsetByMinutes = data['utc_offset'].substring(4, 6);
      // print('$datetime');
      // print('$offset');
      //print(int.parse(offset));
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offset), minutes: int.parse(offsetByMinutes)));
      isDaytime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now); //readable time
      //print(time);
    } catch (e) {
      time = 'could not get time';
    }
  }
}
