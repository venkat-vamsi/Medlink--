import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medlink/hospitals.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/settings.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:io' show Platform;

// ignore: camel_case_types
class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

// ignore: camel_case_types
class _locationState extends State<location> {
  Position? _currentLocation;
  late bool servicepermission = false;
  late LocationPermission permission;
  late String lat;
  late String long;

  String _currentAddress = '';
  Future<Position> _getCurrentLocation() async {
    servicepermission = await Geolocator.isLocationServiceEnabled();
    if (!servicepermission) {
      // ignore: avoid_print
      print("service disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.locality},${place.country}";
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });
  }

  // Future<void> _openMap(double lat, double long) async {
  //   String googleURL =
  //       'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  //   await canLaunchUrlString(googleURL)
  //       ? await launchUrlString(googleURL)
  //       : throw "could not launch $googleURL";
  // }
  Future<void> _openMap(double lat, double long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    if (Platform.isIOS) {
      // For iOS, use Apple Maps
      googleURL = 'https://maps.apple.com/?q=$lat,$long';
    }

    try {
      await launchUrlString(googleURL);
    } catch (e) {
      throw 'Could not launch $googleURL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeN()));
          },
          child: Text('MEDLINK+'),
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => settings()));
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Location Cooridinates",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                'Latitude = ${_currentLocation?.latitude} ; Longitude = ${_currentLocation?.longitude} ;'),
            SizedBox(
              height: 30,
            ),
            Text(
              "Location Address",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text('${_currentAddress}'),
            SizedBox(
              height: 25,
            ),
            /*ElevatedButton(
                onPressed: () async {
                  _currentLocation = await _getCurrentLocation();
                  await _getAddressFromCoordinates();
                  print("${_currentLocation}");
                  print("${_currentAddress}");
                },
                child: Text("GET LOCATION")),
            SizedBox(
              height: 25,
            ),*/
            ElevatedButton(
              onPressed: () async {
                _currentLocation = await _getCurrentLocation();
                await _getAddressFromCoordinates();
                print("${_currentLocation}");
                print("${_currentAddress}");

                // Navigate to NearbyHospitalsWidget with user's location
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NearbyHospitalsWebview(
                      latitude: _currentLocation!.latitude,
                      longitude: _currentLocation!.longitude,
                    ),
                  ),
                );*/
              },
              child: Text("GET LOCATION"),
            ),
            ElevatedButton(
                onPressed: () {
                  _openMap(
                      _currentLocation!.latitude, _currentLocation!.longitude);
                },
                child: Text("OPEN MAPS"))
          ],
        ),
      ),
    );
  }
}
