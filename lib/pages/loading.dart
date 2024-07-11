import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // for loading

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'Loading..';
  void setupWorldTime() async {
  WorldTime instance = WorldTime(location: 'Berlin', flag:'Germany.png',  url:'Europe/Berlin');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
    'time': instance.time,
    'flag': instance.flag,
    'isDaytime': instance.isDaytime,
  }); // passing the data into the build func
  // print("object");
  // print(instance.time);
  // setState(() {
  //   time = instance.time;
  //};
}

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
