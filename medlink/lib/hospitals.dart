/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyHospitalsWidget extends StatefulWidget {
  final double latitude;
  final double longitude;

  NearbyHospitalsWidget({required this.latitude, required this.longitude});

  @override
  _NearbyHospitalsWidgetState createState() => _NearbyHospitalsWidgetState();
}

class _NearbyHospitalsWidgetState extends State<NearbyHospitalsWidget> {
  List<String> nearbyHospitals = [];

  @override
  void initState() {
    super.initState();
    fetchNearbyHospitals();
  }

  Future<void> fetchNearbyHospitals() async {
    final apiKey = "YOUR_GOOGLE_PLACES_API_KEY";
    final radius = 5000; // 5 kilometers

    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${widget.latitude},${widget.longitude}&radius=$radius&type=hospital&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final results = data['results'];

      List<String> hospitals = [];

      for (var result in results) {
        hospitals.add(result['name']);
      }

      setState(() {
        nearbyHospitals = hospitals;
      });
    } else {
      print('Failed to fetch nearby hospitals: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hospitals'),
      ),
      body: nearbyHospitals.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: nearbyHospitals.length,
              itemBuilder: (context, index) {
                final hospital = nearbyHospitals[index];
                return ListTile(
                  title: Text(hospital),
                  subtitle: Text('Open in Google Maps'),
                  onTap: () {
                    openMap(widget.latitude, widget.longitude);
                  },
                );
              },
            ),
    );
  }

  Future<void> openMap(double lat, double long) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}*/




import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NearbyHospitalsWebview extends StatelessWidget {
  final double latitude;
  final double longitude;

  NearbyHospitalsWebview({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    String mapUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude&query_place_id=ChIJb1NzOKsRyzsR7Hz_0F23QuA';

    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hospitals'),
      ),
      body: WebView(
        initialUrl: mapUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
