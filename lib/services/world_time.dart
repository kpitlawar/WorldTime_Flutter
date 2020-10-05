import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the ui
  String time; // time in that location
  String flag; // url to the asset flag icon
  String url; // api
  bool isDayTime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

    Future<void> getTime() async{

      try{

         // make request
    Response respose = await get('http://worldtimeapi.org/api/timezone/$url');
   Map data = jsonDecode(respose.body);

   // get properties from data
   String datetime = data['utc_datetime'];
   String offset = data['utc_offset'].substring(1,3);

   // create datetime object

   DateTime now = DateTime.parse(datetime);
   now = now.add(Duration(hours: int.parse(offset)));

    // set the time 
    isDayTime = now.hour > 6 && now.hour <20 ? true : false;
   time = DateFormat.jm().format(now);
      }
      catch(e){

      }
   
  }
}
