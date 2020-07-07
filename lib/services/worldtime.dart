import 'package:http/http.dart';
import 'dart:convert'; 
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  String updatedTime;
  bool isDayTime;
  WorldTime({this.url, this.location,this.flag});
Future<void> getLocation() async{
  try{
  Response response = await get('http://worldtimeapi.org/api/timezone/$url');
  Map data = jsonDecode(response.body);
  
  // Properties for the time
  String time = data['utc_datetime'];
  List offset = [data['utc_offset'].substring(1,3), data['utc_offset'].substring(4,6)];

  //Create DateTime Object
  DateTime now = DateTime.parse(time);
  now = now.add(Duration(hours: int.parse(offset[0]), minutes:int.parse(offset[1])));

  isDayTime = 06 < now.hour && now.hour < 20 ? true : false;
  updatedTime = DateFormat.jm().format(now);

  }
  catch(e){
    print('error: $e');
    time = 'could not get data';
  }
}
}