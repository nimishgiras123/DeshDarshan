// assets_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_cloud_translation/google_cloud_translation.dart';


void main() {
  runApp(AssetsPage());
}

final FlutterTts flutterTts = FlutterTts();
bool isSpeaking = false;


class AssetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationMessageScreen(),
    );
  }
}

class LocationMessageScreen extends StatefulWidget {
  @override
  _LocationMessageScreenState createState() => _LocationMessageScreenState();
}

class _LocationMessageScreenState extends State<LocationMessageScreen> {
  final Geolocator _geolocator = Geolocator();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final AudioPlayer _audioPlayer = AudioPlayer();

  Position _currentPosition = Position(
    latitude: 0.0,
    longitude: 0.0,
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0,
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    timestamp: DateTime(2000),
  );
  double _radius = 100; // Radius in meters
  String _message = 'Your location will be displayed here'; // Default message
  String _desc = 'Your description will print here';
  String _image = '...';

  @override
  void initState() {
    super.initState();
    _initNotifications();
    _initLocationTracking();
  }

  void _initNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    const IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _speakDescription() async {
    if (_desc.isNotEmpty) {
      await flutterTts.setSpeechRate(0.5); // Adjust the speech rate as needed
      await flutterTts.speak(_desc);
      setState(() {
        isSpeaking = true;
      });
    }
  }

  Future<void> _stopSpeaking() async {
    await flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }


  void _initLocationTracking() {
    Geolocator.getPositionStream().listen((Position position) {
      if (position != null) {
        setState(() {
          _currentPosition = position;
          _checkLocation();
        });
      }
    });
  }


  void _checkLocation() {
    String message = 'Your location will be displayed here'; // Default message
    String desc = 'Your description will print here';
    String image = 'SSBS.jpeg';

    if (_currentPosition != null) {
      // List of target locations with names
      final List<Map<String, dynamic>> targetLocations = [
        {
          'name': 'P_Block',
          'latitude': 28.4497863,
          'longitude': 77.583071,
          'geofenceRadius': 10.0, // Add ".0" to indicate a double
          'detail':"The P Block at Bennett University is a cutting-edge academic facility designed to cater primarily to first-year students. It boasts well-equipped lecture halls, group discussion rooms and interactive learning spaces that encourage student engagement and critical thinking. Moreover, the P Block's modern infrastructure, including high-speed internet, climate control, and safety features, ensures a conducive learning environment."

        },
        {
          'name': 'P_Block',
          'latitude': 28.449573,
          'longitude': 77.5826692,
          'geofenceRadius': 10.0, // Add ".0" to indicate a double
          'detail':"The P Block at Bennett University is a cutting-edge academic facility designed to cater primarily to first-year students. It boasts well-equipped lecture halls, group discussion rooms and interactive learning spaces that encourage student engagement and critical thinking. Moreover, the P Block's modern infrastructure, including high-speed internet, climate control, and safety features, ensures a conducive learning environment."
        },
        {
          'name': 'P_Block',
          'latitude': 28.4497764,
          'longitude': 77.5830817,
          'geofenceRadius': 10.0, // Add ".0" to indicate a double
          'detail':"The P Block at Bennett University is a cutting-edge academic facility designed to cater primarily to first-year students. It boasts well-equipped lecture halls, group discussion rooms and interactive learning spaces that encourage student engagement and critical thinking. Moreover, the P Block's modern infrastructure, including high-speed internet, climate control, and safety features, ensures a conducive learning environment."
        },
        {
          'name': 'P_Block',
          'latitude': 28.4497071,
          'longitude': 77.5828604,
          'geofenceRadius': 15.0, // Add ".0" to indicate a double
          'detail':"The P Block at Bennett University is a cutting-edge academic facility designed to cater primarily to first-year students. It boasts well-equipped lecture halls, group discussion rooms and interactive learning spaces that encourage student engagement and critical thinking. Moreover, the P Block's modern infrastructure, including high-speed internet, climate control, and safety features, ensures a conducive learning environment."

        },
        {
          'name': 'P_Block',
          'latitude': 28.6621696,
          'longitude': 77.2767744,
          'geofenceRadius': 15.0, // Add ".0" to indicate a double
          'detail':"The P Block at Bennett University is a cutting-edge academic facility designed to cater primarily to first-year students. It boasts well-equipped lecture halls, group discussion rooms and interactive learning spaces that encourage student engagement and critical thinking. Moreover, the P Block's modern infrastructure, including high-speed internet, climate control, and safety features, ensures a conducive learning environment."

        },

        {
          'name': 'P_Block',
          'latitude': 28.4495973,
          'longitude': 77.5827548,
          'geofenceRadius': 10.0, // Add ".0" to indicate a double
          'detail':"The P Block at Bennett University is a cutting-edge academic facility designed to cater primarily to first-year students. It boasts well-equipped lecture halls, group discussion rooms and interactive learning spaces that encourage student engagement and critical thinking. Moreover, the P Block's modern infrastructure, including high-speed internet, climate control, and safety features, ensures a conducive learning environment."

        },{
          'name': 'P_Block',
          'latitude': 28.4496534,
          'longitude': 77.5827003,
          'geofenceRadius': 15.0, // Add ".0" to indicate a double
          'detail':"The P Block at Bennett University is a cutting-edge academic facility designed to cater primarily to first-year students. It boasts well-equipped lecture halls, group discussion rooms and interactive learning spaces that encourage student engagement and critical thinking. Moreover, the P Block's modern infrastructure, including high-speed internet, climate control, and safety features, ensures a conducive learning environment."

        },

        {
          'name': 'C_Block',
          'latitude': 28.4511014,
          'longitude': 77.5849085,
          'geofenceRadius': 50,
          'detail':"The C Block at our college is a substantial complex designed to accommodate male students, primarily functioning as a hostel. It is comprised of ten individual buildings, each boasting an impressive twelve floors, making it a prominent feature on our campus. Each building houses a number of rooms(double and triple sharing), providing accommodation for a substantial number of residents. The block also includes common areas, such as study rooms, lounges, and recreational spaces, where students can relax, socialize, and collaborate on academic endeavors."
        },

        {
          'name': 'C_Block',
          'latitude': 28.4511022,
          'longitude': 77.5848437,
          'geofenceRadius': 50,
          'detail':"The C Block at our college is a substantial complex designed to accommodate male students, primarily functioning as a hostel. It is comprised of ten individual buildings, each boasting an impressive twelve floors, making it a prominent feature on our campus. Each building houses a number of rooms(double and triple sharing), providing accommodation for a substantial number of residents. The block also includes common areas, such as study rooms, lounges, and recreational spaces, where students can relax, socialize, and collaborate on academic endeavors."
        },



        {
          'name': 'C_Block',
          'latitude': 28.6294016,
          'longitude':   77.2046848,
          'geofenceRadius': 50,
          'detail':"The C Block at our college is a substantial complex designed to accommodate male students, primarily functioning as a hostel. It is comprised of ten individual buildings, each boasting an impressive twelve floors, making it a prominent feature on our campus. Each building houses a number of rooms(double and triple sharing), providing accommodation for a substantial number of residents. The block also includes common areas, such as study rooms, lounges, and recreational spaces, where students can relax, socialize, and collaborate on academic endeavors."
        },

        {
          'name': 'D_Block',
          'latitude': 28.629402,
          'longitude':   77.204685,
          'geofenceRadius': 50,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."
        },
        {
          'name': 'C_Block',
          'latitude': 28.4511527,
          'longitude':  77.585014,
          'geofenceRadius': 50,
          'detail':"The C Block at our college is a substantial complex designed to accommodate male students, primarily functioning as a hostel. It is comprised of ten individual buildings, each boasting an impressive twelve floors, making it a prominent feature on our campus. Each building houses a number of rooms(double and triple sharing), providing accommodation for a substantial number of residents. The block also includes common areas, such as study rooms, lounges, and recreational spaces, where students can relax, socialize, and collaborate on academic endeavors."

        },
        {
          'name': 'C_Block',
          'latitude': 28.4511912,
          'longitude':  77.5849601,
          'geofenceRadius': 10.0,
          'detail':"The C Block at our college is a substantial complex designed to accommodate male students, primarily functioning as a hostel. It is comprised of ten individual buildings, each boasting an impressive twelve floors, making it a prominent feature on our campus. Each building houses a number of rooms(double and triple sharing), providing accommodation for a substantial number of residents. The block also includes common areas, such as study rooms, lounges, and recreational spaces, where students can relax, socialize, and collaborate on academic endeavors."

        },
        {
          'name': 'C_Block',
          'latitude': 28.4513421,
          'longitude':  77.5852307,
          'geofenceRadius': 10.0,
          'detail':"The C Block at our college is a substantial complex designed to accommodate male students, primarily functioning as a hostel. It is comprised of ten individual buildings, each boasting an impressive twelve floors, making it a prominent feature on our campus. Each building houses a number of rooms(double and triple sharing), providing accommodation for a substantial number of residents. The block also includes common areas, such as study rooms, lounges, and recreational spaces, where students can relax, socialize, and collaborate on academic endeavors."

        },
        {
          'name': 'C_Block',
          'latitude': 28.4512418,
          'longitude':  77.5852414,
          'geofenceRadius': 10.0,
          'detail':"The C Block at our college is a substantial complex designed to accommodate male students, primarily functioning as a hostel. It is comprised of ten individual buildings, each boasting an impressive twelve floors, making it a prominent feature on our campus. Each building houses a number of rooms(double and triple sharing), providing accommodation for a substantial number of residents. The block also includes common areas, such as study rooms, lounges, and recreational spaces, where students can relax, socialize, and collaborate on academic endeavors."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4504983,
          'longitude':  77.5854011,
          'geofenceRadius': 15,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4504433,
          'longitude':  77.5856466,
          'geofenceRadius': 10,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4504554,
          'longitude':  77.5856611,
          'geofenceRadius': 10,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4503693,
          'longitude':  77.585733,
          'geofenceRadius': 10,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4501301,
          'longitude':  77.5858083,
          'geofenceRadius': 10,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4500644,
          'longitude':  77.5858401,
          'geofenceRadius': 8,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4500521,
          'longitude':  77.5857425,
          'geofenceRadius': 8,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4500598,
          'longitude':  77.585719,
          'geofenceRadius': 8,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4501229,
          'longitude':  77.5858767,
          'geofenceRadius': 15,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.450197,
          'longitude':  77.5857307,
          'geofenceRadius': 7,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'D_Block',
          'latitude': 28.4500248,
          'longitude':  77.5856386,
          'geofenceRadius': 15,
          'detail':"The D Block at our college is a prominent complex primarily serving as a hostel for female students. The block includes common areas for studying, socializing, and relaxation. It is comprised of 6 buildings from D1 to D6. Notably, D6 within the D Block serves as a hostel for male students.Each building within the D Block offers a range of rooms, including double and triple sharing options, ensuring ample accommodation for a significant number of female students. The block is designed with the well-being and academic needs of its residents in mind."

        },
        {
          'name': 'A_Block',
          'latitude': 28.4502082,
          'longitude':  77.5843349,
          'geofenceRadius': 15,
          'detail':"Bennett University's Academic Block is the main campus learning hub with two libraries: the Main Library for research and the Law Library for aspiring lawyers. Inside, The Hatchery supports student startups. The modern building's open spaces and natural light provide an ideal environment for learning and collaboration, preparing students for the future."

        },
        {
          'name': 'A_Block',
          'latitude': 28.4501763,
          'longitude':  77.5842366,
          'geofenceRadius': 15,
          'detail':"Bennett University's Academic Block is the main campus learning hub with two libraries: the Main Library for research and the Law Library for aspiring lawyers. Inside, The Hatchery supports student startups. The modern building's open spaces and natural light provide an ideal environment for learning and collaboration, preparing students for the future."

        },
        {
          'name': 'A_Block',
          'latitude': 28.4501763,
          'longitude':  77.5842366,
          'geofenceRadius': 15,
          'detail':"Bennett University's Academic Block is the main campus learning hub with two libraries: the Main Library for research and the Law Library for aspiring lawyers. Inside, The Hatchery supports student startups. The modern building's open spaces and natural light provide an ideal environment for learning and collaboration, preparing students for the future."

        },
        {
          'name': 'A_Block',
          'latitude': 28.4501827,
          'longitude':  77.584255,
          'geofenceRadius': 15,
          'detail':"Bennett University's Academic Block is the main campus learning hub with two libraries: the Main Library for research and the Law Library for aspiring lawyers. Inside, The Hatchery supports student startups. The modern building's open spaces and natural light provide an ideal environment for learning and collaboration, preparing students for the future."

        },
        {
          'name': 'A_Block',
          'latitude': 28.4501393,
          'longitude':  77.5842478,
          'geofenceRadius': 15,
          'detail':"Bennett University's Academic Block is the main campus learning hub with two libraries: the Main Library for research and the Law Library for aspiring lawyers. Inside, The Hatchery supports student startups. The modern building's open spaces and natural light provide an ideal environment for learning and collaboration, preparing students for the future."
        },
        {
          'name': 'A_Block',
          'latitude': 28.4500072,
          'longitude':  77.584331,
          'geofenceRadius': 10.0,
          'detail':"Bennett University's Academic Block is the main campus learning hub with two libraries: the Main Library for research and the Law Library for aspiring lawyers. Inside, The Hatchery supports student startups. The modern building's open spaces and natural light provide an ideal environment for learning and collaboration, preparing students for the future."
        },
        {
          'name': 'A_Block',
          'latitude': 28.4499776,
          'longitude':  77.5843098,
          'geofenceRadius': 10.0,
          'detail':"Bennett University's Academic Block is the main campus learning hub with two libraries: the Main Library for research and the Law Library for aspiring lawyers. Inside, The Hatchery supports student startups. The modern building's open spaces and natural light provide an ideal environment for learning and collaboration, preparing students for the future."
        },

        {
          'name': 'M_Block',
          'latitude': 28.4496124,
          'longitude':  77.5840297,
          'geofenceRadius': 15,
          'detail':"M Block at Bennett University is a vital campus hub, featuring a delightful Mess offering diverse meals. Professors have dedicated staff rooms for collaboration, fostering a sense of community. Additionally, there's a tranquil reading room for study and research. M Block embodies unity, uniting students and faculty for nourishment and focused learning."

        },

        {
          'name': 'M_Block',
          'latitude': 28.4495671,
          'longitude':  77.5841467,
          'geofenceRadius': 15,
          'detail':"M Block at Bennett University is a vital campus hub, featuring a delightful Mess offering diverse meals. Professors have dedicated staff rooms for collaboration, fostering a sense of community. Additionally, there's a tranquil reading room for study and research. M Block embodies unity, uniting students and faculty for nourishment and focused learning."
        },
        {
          'name': 'M_Block',
          'latitude': 28.4494481,
          'longitude':  77.5840041,
          'geofenceRadius': 15,
          'detail':"M Block at Bennett University is a vital campus hub, featuring a delightful Mess offering diverse meals. Professors have dedicated staff rooms for collaboration, fostering a sense of community. Additionally, there's a tranquil reading room for study and research. M Block embodies unity, uniting students and faculty for nourishment and focused learning."
        },
        {
          'name': 'M_Block',
          'latitude': 28.4496965,
          'longitude':  77.5841204,
          'geofenceRadius': 15,
          'detail':"M Block at Bennett University is a vital campus hub, featuring a delightful Mess offering diverse meals. Professors have dedicated staff rooms for collaboration, fostering a sense of community. Additionally, there's a tranquil reading room for study and research. M Block embodies unity, uniting students and faculty for nourishment and focused learning."

        },
        {
          'name': 'Auditorium',
          'latitude': 28.7327734,
          'longitude':  77.1186994,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7327734,
          'longitude':  77.1186994,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7327694,
          'longitude':  77.1187082,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7327676,
          'longitude':  77.1187002,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7326993,
          'longitude':  77.1185747,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7326968,
          'longitude':  77.1185562,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.732672,
          'longitude':  77.1185186,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.73277407,
          'longitude':  77.1187147,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7326789,
          'longitude':  77.1187045,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7327851,
          'longitude':  77.118711,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7327747,
          'longitude':  77.1186997,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Auditorium',
          'latitude': 28.7327837,
          'longitude':  77.1187134,
          'geofenceRadius': 5,
          'image':"audi.jpeg",
          'detail':"It is a 2-floor auditorium with a seating capacity of 524. It is located on the first and second floor of the building. It is fully air-conditioned and Wi-Fi enabled. It has latest audio/visual equipment and lighting system."
        },
        {
          'name': 'Entrance',
          'latitude': 28.7326649,
          'longitude':  77.1179998,
          'geofenceRadius': 5,
          'image':"entrance.jpeg",
          'detail':"The entrance gate of Shaheed Sukhdev College of Business Studies (SSCBS) is an inviting and iconic structure that marks the beginning of a student's journey into this esteemed college. Located in Delhi, India, SSCBS is known for its strong emphasis on business and management education."
        },
        {
          'name': 'Entrance',
          'latitude': 28.7327626,
          'longitude':  77.1181336,
          'geofenceRadius': 5,
          'image':"entrance.jpeg",
          'detail':"The entrance gate of Shaheed Sukhdev College of Business Studies (SSCBS) is an inviting and iconic structure that marks the beginning of a student's journey into this esteemed college. Located in Delhi, India, SSCBS is known for its strong emphasis on business and management education."
        },
        {
          'name': 'Entrance',
          'latitude': 28.7327385,
          'longitude':  77.1181976,
          'geofenceRadius': 5,
          'image':"entrance.jpeg",
          'detail':"The entrance gate of Shaheed Sukhdev College of Business Studies (SSCBS) is an inviting and iconic structure that marks the beginning of a student's journey into this esteemed college. Located in Delhi, India, SSCBS is known for its strong emphasis on business and management education."
        },
        {
          'name': 'Nescafe',
          'latitude': 28.7325011,
          'longitude':  77.1192231,
          'geofenceRadius': 10,
          'image':"nescafe.jpeg",
          'detail':"A place to chill out and hang with your friends. It, being one of the two food establishments in the college, is an integral part of the day to day life of a CBSite. The Nescafe booth at the college doesn’t have a lot of products to offer but the shade under the counter and a cold coffee is enough for us to chat about anything and everything ranging from assignments to society gossip."
        },
        {
          'name': 'Nescafe',
          'latitude': 28.7325329,
          'longitude':  77.1192247,
          'geofenceRadius': 10,
          'image':"nescafe.jpeg",
          'detail':"A place to chill out and hang with your friends. It, being one of the two food establishments in the college, is an integral part of the day to day life of a CBSite. The Nescafe booth at the college doesn’t have a lot of products to offer but the shade under the counter and a cold coffee is enough for us to chat about anything and everything ranging from assignments to society gossip."
        },
        {
          'name': 'Nescafe',
          'latitude': 28.732499,
          'longitude':  77.1192024,
          'geofenceRadius': 10,
          'image':"nescafe.jpeg",
          'detail':"A place to chill out and hang with your friends. It, being one of the two food establishments in the college, is an integral part of the day to day life of a CBSite. The Nescafe booth at the college doesn’t have a lot of products to offer but the shade under the counter and a cold coffee is enough for us to chat about anything and everything ranging from assignments to society gossip."
        },
        {
          'name': 'Nescafe',
          'latitude': 28.7324752,
          'longitude':  77.1191656,
          'geofenceRadius': 10,
          'image':"nescafe.jpeg",
          'detail':"A place to chill out and hang with your friends. It, being one of the two food establishments in the college, is an integral part of the day to day life of a CBSite. The Nescafe booth at the college doesn’t have a lot of products to offer but the shade under the counter and a cold coffee is enough for us to chat about anything and everything ranging from assignments to society gossip."
        },
        {
          'name': 'Exit',
          'latitude': 28.7322084,
          'longitude':  77.1190202,
          'geofenceRadius': 10,
          'image':"exit.jpeg",
          'detail':"The  exit of Shaheed Sukhdev College of Business Studies"
        },
        {
          'name': 'Exit',
          'latitude': 28.7321193,
          'longitude':  77.1190143,
          'geofenceRadius': 10,
          'image':"exit.jpeg",
          'detail':"The  exit of Shaheed Sukhdev College of Business Studies"
        },
        {
          'name': 'Exit',
          'latitude': 28.7322986,
          'longitude':  77.1188416,
          'geofenceRadius': 10,
          'image':"exit.jpeg",
          'detail':"The  exit of Shaheed Sukhdev College of Business Studies"
        },
        {
          'name': 'Exit',
          'latitude': 28.7322084,
          'longitude':  77.1190202,
          'geofenceRadius': 10,
          'image':"exit.jpeg",
          'detail':"The  exit of Shaheed Sukhdev College of Business Studies"
        },
        {
          'name': 'Room 723B',
          'latitude': 28.7328745,
          'longitude':  77.1188027,
          'geofenceRadius': 5,
          'image':"723B.jpeg",
          'detail':"The room is used as examination room"
        },
        {
          'name': 'Room 723B',
          'latitude': 28.7328682,
          'longitude':  77.1188082,
          'geofenceRadius': 5,
          'image':"723B.jpeg",
          'detail':"The room is used as examination room"
        },
        {
          'name': 'Room 723B',
          'latitude': 28.7328566,
          'longitude':  77.1187948,
          'geofenceRadius': 5,
          'image':"723B.jpeg",
          'detail':"The room is used as examination room"
        },
        {
          'name': 'Room 723B',
          'latitude': 28.7328673,
          'longitude':  77.1188087,
          'geofenceRadius': 5,
          'image':"723B.jpeg",
          'detail':"The room is used as examination room"
        },
        {
          'name': 'Room 723B',
          'latitude': 28.7328745,
          'longitude':  77.1188027,
          'geofenceRadius': 5,
          'image':"723B.jpeg",
          'detail':"The room is used as examination room"
        }
      ];

      // Calculate the distance to each target location
      for (final location in targetLocations) {
        final double distanceInMeters = Geolocator.distanceBetween(
          _currentPosition.latitude,
          _currentPosition.longitude,
          location['latitude'],
          location['longitude'],
        );

        // Check if the user is within the geofence radius of the target location
        if (distanceInMeters <= location['geofenceRadius']) {
          // Set the message to the location name
          message = location['name'];
          desc = location['detail'];
          image = location['image'];
          break; // Exit the loop if inside geofence of any target location
        }

      }
    }

    // Update the message below the map
    setState(() {
      _message = message;
      _desc = desc;
      _image = image;
    });
  }

  void _showNotification(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'location_message_app',
      'Location Messages',

      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Location Alert',
      message,
      platformChannelSpecifics,
    );
  }

  void _playAudio() {
    print("Audio played");
    // _audioPlayer.play('', isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SSBS'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$_image', // Replace with your image asset path
              width: 350, // Adjust the width as needed
              height: 240, // Adjust the height as needed
            ),

            Center(
              child: _currentPosition != null
                  ? Padding(
                padding: EdgeInsets.only(top: 30), // Add top padding
                child: Text(
                  'Latitude: ${_currentPosition.latitude}\nLongitude: ${_currentPosition.longitude}',
                ),
              )
                  : Text('Waiting for location...'),
            ),
    SizedBox(height: 10),

    // Add the Image widget with the desired image asset

    SizedBox(height: 15),
    Text(
    '$_message',
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    Padding(
    padding: EdgeInsets.all(15.0),
    child: Text(
    '$_desc',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    ),
    ),SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isSpeaking) {
                  _stopSpeaking();
                } else {
                  _speakDescription();
                }
              },
              child: Text(isSpeaking ? 'Stop Speaking' : 'Speak Description'),
            ),
          ],
        ),
    );
  }
}


