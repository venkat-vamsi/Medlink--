import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/news/homenews.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:google_fonts/google_fonts.dart';

class insurance extends StatefulWidget {
  @override
  _insuranceState createState() => _insuranceState();
}

class _insuranceState extends State<insurance> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;

  List<String> _imagePaths = [];

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    User? user = _auth.currentUser;
    setState(() {
      _user = user;
    });

    if (_user != null) {
      // Load user-specific images
      _loadUserImages();
    }
  }

  Future<void> _loadUserImages() async {
    if (_user != null) {
      QuerySnapshot querySnapshot = await _firestore
          .collection(
              'insurance_images') // Change collection name to insurance_images
          .where('userId', isEqualTo: _user!.uid)
          .get();

      List<String> imageUrls = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        String imageUrl = documentSnapshot['imageUrl'];
        imageUrls.add(imageUrl);
      }

      setState(() {
        _imagePaths = imageUrls;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null && _user != null) {
        String imageUrl = await _uploadImage(File(pickedFile.path));
        await _saveImageToFirestore(imageUrl);
        _loadUserImages(); // Reload images after adding a new one
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(
        'insurance_images/${_user!.uid}/$fileName'); // Change path to insurance_images
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageTaskSnapshot =
        await uploadTask.whenComplete(() => null);
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> _saveImageToFirestore(String imageUrl) async {
    if (_user != null) {
      await _firestore.collection('insurance_images').add({
        // Change collection name to insurance_images
        'imageUrl': imageUrl,
        'userId': _user!.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> _loadImagesFromFirestore() async {
    // Load image URLs from Firestore
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('insurance_images').get();

    List<String> imageUrls = [];

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      String imageUrl = documentSnapshot['imageUrl'];
      imageUrls.add(imageUrl);
    }

    setState(() {
      _imagePaths = imageUrls;
    });
  }

  Future<void> _deleteImage(String imageUrl) async {
    await FirebaseFirestore.instance
        .collection('insurance_images')
        .where('imageUrl', isEqualTo: imageUrl)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });

    FirebaseStorage.instance.refFromURL(imageUrl).delete();

    setState(() {
      _imagePaths.remove(imageUrl);
    });
  }

  Future<void> _showDeleteDialog(String imageUrl) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Image'),
          content: Text('Are you sure you want to delete this image?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteImage(imageUrl);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  color: Colors.teal[50],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Text(
                    'Insurances',
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
                ],
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  color: Colors.teal[50],
                ),
              ),
              if (_imagePaths.isEmpty)
                Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      'Store images of your',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      ' insurance documents',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'here...',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 40.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              for (var imagePath in _imagePaths)
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(
                              images: _imagePaths,
                              initialIndex: _imagePaths.indexOf(imagePath)),
                        ),
                      );
                    },
                    onLongPress: () {
                      _showDeleteDialog(imagePath);
                    },
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: PhotoView(
                        imageProvider: NetworkImage(imagePath),
                        backgroundDecoration: BoxDecoration(
                          color: Colors.teal[50],
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        splashColor: Colors.teal[50],
        elevation: 10,
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const ImageViewer({required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
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
