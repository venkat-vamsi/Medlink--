import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/settings.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(MaterialApp(
    home: EmergencyPage(),
  ));
}

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  final TextEditingController _emergencyController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();
  String? _emergencyLocation;
  List<String> _imageUrls = [];

  Future<void> _submitEmergency() async {
    String emergencyText = _emergencyController.text.trim();

    if (emergencyText.isNotEmpty && _emergencyLocation != null) {
      print("Submitting Emergency...");
      print("Emergency Text: $emergencyText");
      print("Emergency Location: $_emergencyLocation");

      List<String> imageUrls = await _uploadImages();

      // Get the current user
      User? _user = FirebaseAuth.instance.currentUser;

      if (_user != null) {
        String userId = _user.uid;
        String userName = await _getUserName(userId);

        await _firestore.collection('emergencies').add({
          'userId': userId,
          'userName': userName,
          'emergencyText': emergencyText,
          'emergencyLocation': _emergencyLocation,
          'imageUrls': imageUrls,
          'timestamp': FieldValue.serverTimestamp(),
        });

        _emergencyController.clear();
        _imageUrls.clear();
        setState(() {});
      } else {
        print('No user is currently signed in.');
      }
    }
  }

  Future<List<String>> _uploadImages() async {
    List<String> imageUrls = [];

    for (File imageFile in _imageUrls.map((url) => File(url))) {
      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference =
            _storage.ref().child('emergency_images/$fileName.jpg');
        UploadTask uploadTask = reference.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      } catch (e) {
        print("Error uploading image: $e");
      }
    }

    return imageUrls;
  }

  Future<String> _getCurrentLocation() async {
    try {
      bool servicePermission = await Geolocator.isLocationServiceEnabled();
      if (!servicePermission) {
        print("Location service disabled");
        return "";
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        print("Location permission denied forever");
        return "";
      }

      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        localeIdentifier: "en_US",
      );

      Placemark place = placemarks[0];
      String location = "${place.locality}, ${place.country}";
      print("Current Location: $location");
      return location;
    } catch (e) {
      print("Error getting location: $e");
      return "";
    }
  }

  Future<void> _pickImages() async {
    try {
      List<XFile>? pickedFiles = await _imagePicker.pickMultiImage();

      setState(() {
        _imageUrls = pickedFiles?.map((file) => file.path).toList() ?? [];
      });
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  Future<String> _getUserName(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(userId).get();
      if (userSnapshot.exists) {
        return userSnapshot['name'];
      } else {
        return 'Unknown User';
      }
    } catch (e) {
      print("Error getting user name: $e");
      return 'Unknown User';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Emergency Posts',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 28.0,
                //fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2,
                //decoration: TextDecoration.underline,
                decorationThickness: 2.0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firestore.collection('emergencies').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                var emergencies = snapshot.data!.docs;
                List<Widget> emergencyWidgets = [];
                for (var emergency in emergencies) {
                  var emergencyData = emergency.data() as Map<String, dynamic>;
                  var emergencyText = emergencyData['emergencyText'];
                  var userName = emergencyData['userName'];
                  var emergencyLocation = emergencyData['emergencyLocation'];
                  var imageUrls =
                      List<String>.from(emergencyData['imageUrls'] ?? []);

                  var emergencyWidget = _buildEmergencyWidget(
                    userName,
                    emergencyText,
                    emergencyLocation,
                    imageUrls,
                  );
                  emergencyWidgets.add(emergencyWidget);
                }

                return ListView(
                  children: emergencyWidgets,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _emergencyController,
                  decoration: InputDecoration(
                    hintText: 'Describe the emergency...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: _pickImages,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.black45,
                      alignment: Alignment.center,
                      child: Text(
                        'Pick Image',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    )),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () async {
                      _emergencyLocation = await _getCurrentLocation();
                      _submitEmergency();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Text(
                        'Publish Post',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    )),
                if (_imageUrls.isNotEmpty)
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: _imageUrls.map((url) {
                      return Image.file(
                        File(url),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyWidget(String userName, String? emergencyText,
      String? emergencyLocation, List<String> imageUrls) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: ListTile(
        title: Text(userName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emergencyText ?? ''),
            SizedBox(height: 5),
            //Text("Location: $emergencyLocation"),
            SizedBox(height: 5),
            if (imageUrls.isNotEmpty)
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: imageUrls.map((url) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(
                            imageUrls: imageUrls,
                            initialIndex: imageUrls.indexOf(url),
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      url,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  ImageViewer({required this.imageUrls, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: imageUrls.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrls[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}
