import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; //locaton name for the UI
  String? time; //time in that location
  String? flag; //url to an asset flag icon
  String? locationUrl; //location url for api endpoint. e.g. /Europe/london
  bool isDaytime = true; //true or false if it is daytime or now

  WorldTime(
      {required this.location, required this.flag, required this.locationUrl});

  Future<void> getTime() async {
    try {
      //make the timezone request for London
      //http://worldtimeapi.org/api/timezone/Europe/London
      var url = Uri.http('worldtimeapi.org', locationUrl!);
      Response response = await get(url);

      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create a Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set daytime property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      //set time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'could not get time data';
    }
  }
}
