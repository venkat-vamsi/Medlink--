/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/settings.dart';

class HospitalReviewsPage extends StatefulWidget {
  const HospitalReviewsPage({Key? key}) : super(key: key);

  @override
  _HospitalReviewsPageState createState() => _HospitalReviewsPageState();
}

class _HospitalReviewsPageState extends State<HospitalReviewsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _hospitalSearchController =
      TextEditingController();
  final TextEditingController _hospitalController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  String _searchedHospitalName = '';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    _user = _auth.currentUser;
    if (_user == null) {
      print("User not logged in");
    }
  }

  void _submitReview() async {
    if (_user == null) {
      print("User not logged in");
      return;
    }

    String hospitalName = _hospitalController.text.trim();
    String reviewText = _reviewController.text.trim();

    if (reviewText.isNotEmpty && hospitalName.isNotEmpty) {
      await _firestore.collection('hospital_reviews').add({
        'userId': _user!.uid,
        'userName': _user!.displayName ?? 'Anonymous',
        'hospitalName': hospitalName,
        'reviewText': reviewText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _hospitalController.clear();
      _reviewController.clear();
      _searchedHospitalName = _hospitalSearchController.text.trim();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationDrawerWidget(),
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
            'Care Critics',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _hospitalSearchController,
              onChanged: (value) {
                setState(() {
                  _searchedHospitalName = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Hospital Name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('hospital_reviews')
                  .where('hospitalName',
                      isGreaterThanOrEqualTo: _searchedHospitalName)
                  .where('hospitalName',
                      isLessThan: _searchedHospitalName + 'z')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var reviews = snapshot.data!.docs;
                List<Widget> reviewWidgets = [];
                for (var review in reviews) {
                  var reviewData = review.data() as Map<String, dynamic>;
                  var reviewText = reviewData['reviewText'];
                  var userName = reviewData['userName'];
                  var hospitalName = reviewData['hospitalName'];

                  var reviewWidget = _buildReviewWidget(
                    userName,
                    hospitalName,
                    reviewText,
                  );
                  reviewWidgets.add(reviewWidget);
                }

                return ListView(
                  children: reviewWidgets,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _hospitalController,
                  decoration: const InputDecoration(
                    hintText: 'Hospital Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: _reviewController,
                  decoration: const InputDecoration(
                    hintText: 'Write your review...',
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Publish Review',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _submitReview,
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewWidget(
    String userName,
    String? hospitalName,
    String? reviewText,
  ) {
    return Card(
      
      margin: const EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: ListTile(
        title: Text('$userName - ${hospitalName ?? 'Unknown Hospital'}'),
        subtitle: Text(reviewText ?? ''),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: HospitalReviewsPage(),
      ),
    ),
  );
}*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/settings.dart';

class HospitalReviewsPage extends StatefulWidget {
  const HospitalReviewsPage({Key? key}) : super(key: key);

  @override
  _HospitalReviewsPageState createState() => _HospitalReviewsPageState();
}

class _HospitalReviewsPageState extends State<HospitalReviewsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _hospitalSearchController =
      TextEditingController();
  final TextEditingController _hospitalController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  String _searchedHospitalName = '';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    _user = _auth.currentUser;
    if (_user == null) {
      print("User not logged in");
    }
  }

  void _submitReview() async {
    if (_user == null) {
      print("User not logged in");
      return;
    }

    String hospitalName = _hospitalController.text.trim();
    String reviewText = _reviewController.text.trim();

    if (reviewText.isNotEmpty && hospitalName.isNotEmpty) {
      await _firestore.collection('hospital_reviews').add({
        'userId': _user!.uid,
        'userName': _user!.displayName ?? 'Anonymous',
        'hospitalName': hospitalName,
        'reviewText': reviewText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _hospitalController.clear();
      _reviewController.clear();
      _searchedHospitalName = _hospitalSearchController.text.trim();
      setState(() {});
    }
  }

  Future<String> _fetchUsername(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(userId).get();
      print(userId);
      if (userSnapshot.exists) {
        return userSnapshot['name'];
      } else {
        return 'Unknown User';
      }
    } catch (e) {
      print("Error fetching username: $e");
      return 'Unknown User';
    }
  }

  Widget _buildReviewWidget(
    String userId,
    String? hospitalName,
    String? reviewText,
  ) {
    return FutureBuilder<String>(
      future: _fetchUsername(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.grey[300],
            child: ListTile(
              title: Text('Fetching username...'),
            ),
          );
        }

        String username = snapshot.data ?? 'Unknown User';
        return Card(
          margin: const EdgeInsets.all(8.0),
          color: Colors.grey[300],
          child: ListTile(
            title: Text('${hospitalName ?? 'Unknown Hospital'}'),
            subtitle: Text(reviewText ?? ''),
          ),
        );
      },
    );
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
            'Care Critics',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                letterSpacing: 1.2,
                decorationThickness: 2.0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _hospitalSearchController,
              onChanged: (value) {
                setState(() {
                  _searchedHospitalName = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Hospital Name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('hospital_reviews')
                  .where('hospitalName',
                      isGreaterThanOrEqualTo: _searchedHospitalName)
                  .where('hospitalName',
                      isLessThan: _searchedHospitalName + 'z')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var reviews = snapshot.data!.docs;
                List<Widget> reviewWidgets = [];
                for (var review in reviews) {
                  var reviewData = review.data() as Map<String, dynamic>;
                  var reviewText = reviewData['reviewText'];
                  var userId = reviewData['userId'];
                  var hospitalName = reviewData['hospitalName'];

                  var reviewWidget = _buildReviewWidget(
                    userId,
                    hospitalName,
                    reviewText,
                  );
                  reviewWidgets.add(reviewWidget);
                }

                return ListView(
                  children: reviewWidgets,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _hospitalController,
                  decoration: const InputDecoration(
                    hintText: 'Hospital Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: _reviewController,
                  decoration: const InputDecoration(
                    hintText: 'Write your review...',
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Publish Review',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _submitReview,
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: HospitalReviewsPage(),
      ),
    ),
  );
}
