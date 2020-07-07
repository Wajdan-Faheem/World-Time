import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';  

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter =0;
 List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getLocation();
    print(instance.updatedTime + '${instance.isDayTime}');
    Navigator.pop(context,{
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.updatedTime,
    'day': instance.isDayTime,
  } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        title: Text('Locations'),
        centerTitle: true
      ),
    body: ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index ){
        return Card(
          child: ListTile(
          onTap: (){
            updateTime(index);
            
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/${locations[index].flag}'),
          ),
          title: Text(locations[index].location),
        

                     
          )
        );
      }
      )

    );
    
  }
}