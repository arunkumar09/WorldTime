import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'London',
        flag: 'UK.gif',
        locationUrl: '/api/timezone/Europe/London'),
    WorldTime(
        location: 'Athens',
        flag: 'Greece.gif',
        locationUrl: '/api/timezone/Europe/Athens'),
    WorldTime(
        location: 'Berlin',
        flag: 'Germany.gif',
        locationUrl: '/api/timezone/Europe/Berlin'),
    WorldTime(
        location: 'Cairo',
        flag: 'Egypt.gif',
        locationUrl: '/api/timezone/Africa/Cairo'),
    WorldTime(
        location: 'Nairobi',
        flag: 'Kenya.gif',
        locationUrl: '/api/timezone/Africa/Nairobi'),
    WorldTime(
        location: 'Chicago',
        flag: 'US.gif',
        locationUrl: '/api/timezone/America/Chicago'),
    WorldTime(
        location: 'New York',
        flag: 'US.gif',
        locationUrl: '/api/timezone/America/New_York'),
    WorldTime(
        location: 'Seoul',
        flag: 'SouthKorea.gif',
        locationUrl: '/api/timezone/Asia/Seoul'),
    WorldTime(
        location: 'Jakarta',
        flag: 'Indonesia.gif',
        locationUrl: '/api/timezone/Asia/Jakarta')
  ];

  void updateTime(index) async {
    WorldTime _worldTime = locations[index];
    await _worldTime.getTime();
    //navigate to Home
    //pass data to Home
    Navigator.pop(context, {
      'location': _worldTime.location,
      'flag': _worldTime.flag,
      'time': _worldTime.time,
      'isDaytime': _worldTime.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location!),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
