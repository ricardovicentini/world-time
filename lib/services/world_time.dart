import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  String location; //lacation name for the ui
  String time; // time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDayTime; //


  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      if(response.statusCode != 200)
      {
        isDayTime = false;
        time = data['error'];
        return;
      }

      //print(data);
      //get properties from data
      String datetime = data['datetime'].toString().substring(0,19);
      int dstOffset = data['dst'] ? data['dst_offset'] : 0;

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(seconds: dstOffset));

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      //set de time property
      time  = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = 'could not get time data';
      isDayTime = false;
    }


  }

}