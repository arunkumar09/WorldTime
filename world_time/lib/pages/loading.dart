import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime _worldTime = WorldTime(
        location: 'Berlin',
        flag: 'germany.png',
        locationUrl: '/api/timezone/Europe/Berlin');
    await _worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': _worldTime.location,
      'flag': _worldTime.flag,
      'time': _worldTime.time,
      'isDaytime': _worldTime.isDaytime
    });
    // setState(() {
    //   time = _worldTime.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
