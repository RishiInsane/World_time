import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'London.jpg', url: 'Europe/London'),
    WorldTime(location: 'Chicago', flag: 'Chicago.jpg', url: 'America/Chicago'),
    WorldTime(location: 'Denver', flag: 'Denver.jpg', url: 'America/Denver'),
    WorldTime(
        location: 'New York', flag: 'NewYork.jpg', url: 'America/New_York'),
    WorldTime(location: 'Dubai', flag: 'Dubai.jpg', url: 'Asia/Dubai'),
    WorldTime(
        location: 'Kolkata', flag: 'Flag-India.jpg.webp', url: 'Asia/Kolkata'),
    WorldTime(
        location: 'Singapore', flag: 'Singapore.png', url: 'Asia/Singapore'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
