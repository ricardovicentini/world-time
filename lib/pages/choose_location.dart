import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'America/Sao_Paulo', location: 'São Paulo', flag: 'brazil.gif'),
    WorldTime(url: 'America/Santiago', location: 'Santiago', flag: 'chile.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.gif'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.gif'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.gif'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.gif'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.gif'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.gif'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.gif'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonisia.gif'),

  ];


  void updateTime(index) async{
    var instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime

    });


  }


  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a loction'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: ()=> updateTime(index),
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
