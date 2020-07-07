import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';  
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String time = 'loading';
  void setupTime() async{
   WorldTime instance = WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.png');
  await (instance.getLocation());
  
  print(instance.updatedTime);
  setState((){
  time = instance.updatedTime;
  Navigator.pushReplacementNamed(context, '/home',arguments:{
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.updatedTime,
    'day': instance.isDayTime
  } );
  }
  ); 

  }
  @override 
  void initState() {
    super.initState();  
    setupTime();
    } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Center(
        child:SpinKitRotatingCircle(
    color: Colors.white,
    size: 100.0,
    ),
      )
    );
  }
}