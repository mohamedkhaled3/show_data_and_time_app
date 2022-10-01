import 'package:flutter/material.dart';
import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
///////////////////////////////////////////////////dart
// variable "Dates"
  String day = ""; //
  String mounth = "";
  // variable "time" that change every 1 second
  int hour = 0;
  String minute = "";
  String second = "";
  //
  String status = "Am";

  // DateTime now = DateTime.now(); // لا يُفضل تخزين تخذين هذا الكود داخل variable
  // now.day // int    ---- string
  // now.mounth // int ---- string

// to changeTimeEverySecond
  changeTimeEverySecond() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // variable "Dates"
        day = DateTime.now().day.toString();
        switch (day) {
          case "1":
            day = "suterday";
            break;
          case "2":
            day = "sunday";
            break;
          //////////////then all days 1 to 30
          /// I not need default becouse all value I know
        }
        mounth = DateTime.now().month.toString();
        switch (mounth) {
          case "1":
            mounth = "January";
            break;
          case "2":
            mounth = "February";
            break;
          case "3":
            mounth = "March";
            break;
          case "4":
            mounth = "April";
            break;
          case "5":
            mounth = "May";
            break;
          case "6":
            mounth = "June";
            break;
          case "7":
            mounth = "Jule";
            break;
          case "8":
            mounth = "August";
            break;
          case "9":
            mounth = "Septemper";
            break;
          case "10":
            mounth = "October";
            break;
          case "11":
            mounth = "November";
            break;
          case "12":
            mounth = "December";
            break;

          /// I not need default becouse all value I know
        }

        // variable "time" that change every 1 second
        // hour = now.hour.toString();
        // minute = now.minute.toString();
        // second = now.second.toString();   // wrong don't wrong every second ?? to change every 1 second
        hour = DateTime.now().hour;
        if (hour > 12) {
          // to make hour easy to read ex 13=1 ..
          hour = hour - 12;
          status = "Pm";
        }
        else{
          status = "Am";
        }
        minute = DateTime.now().minute.toString();
        second = DateTime.now().second.toString();
      });
    });
  }

  String text = "";
// function بعد مُده مُعينة مره واحده مره واحده فإننا نستخدم هذا الكود
  calledOnlyOnTimeAfter7Sexond() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        text = "❤❤❤";
      });
    });
  }

  // تنفذ الاكواد التي بداخلها عند تشغيل البرنامج لاول مره
  //called once when your app. is starting for the first time
  // invoke fun when run automatically
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeTimeEverySecond();
    calledOnlyOnTimeAfter7Sexond();
  }

///////////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        title: Text(
          "Time & Date App",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $day", //////////
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "$mounth ,${DateTime.now().day.toString()}, ${DateTime.now().year.toString()}", /////////
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "${hour.toString().padLeft(2, '0')} :${minute.padLeft(2, '0')} :${second.padLeft(2, '0')}", ///// change every second
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
               SizedBox( width: 22,),
               
               Text("$status",style: TextStyle(fontSize: 27, color: Colors.white),),                     
              ],
            ),
            SizedBox(
              height: 22,
            ),
          
            Text(
              "$text",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
