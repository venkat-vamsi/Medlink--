import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlink/emergency.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/location.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/news/models/article_model.dart';
import 'package:medlink/news/models/category_model.dart';
import 'package:medlink/news/models/slider_model.dart';
import 'package:medlink/news/pages/all_news.dart';
import 'package:medlink/news/pages/article_view.dart';
import 'package:medlink/news/pages/category_news.dart';
import 'package:medlink/news/services/data.dart';
import 'package:medlink/news/services/news.dart';
import 'package:medlink/news/services/slider_data.dart';
import 'package:medlink/reviews.dart';
import 'package:medlink/settings.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeN extends StatefulWidget {
  const HomeN({super.key});

  @override
  State<HomeN> createState() => _HomeState();
}

class _HomeState extends State<HomeN> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true, loading2 = true;

  int activeIndex = 0;
  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      loading2 = false;
    });
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()));
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "What's new?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllNews(news: "Breaking")));
                              },
                              child: Text(
                                "View it",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      loading2
                          ? Center(child: CircularProgressIndicator())
                          : CarouselSlider.builder(
                              itemCount: 5,
                              itemBuilder: (context, index, realIndex) {
                                String? res = sliders[index].urlToImage;
                                String? res1 = sliders[index].title;
                                return buildImage(res!, index, res1!);
                              },
                              options: CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height * 0.33,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  })),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(child: buildIndicator()),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HOME(
                                                  userId: '',
                                                )));
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: MediaQuery.of(context).size.width /
                                        1.11,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          opacity: 0.7,
                                          image: AssetImage(
                                              'assets/images/med_2.gif'),
                                          fit: BoxFit.cover),
                                      //color: Colors.teal[100],
                                      color: Colors.teal[100],
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: /*Text(
                                      '   Medical\nInformation',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),*/
                                        Text(
                                      '   Medical\nInformation',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 23,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          letterSpacing: 1.2,
                                          //decoration: TextDecoration.underline,
                                          decorationThickness: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HospitalReviewsPage()));
                                  },
                                  child: Container(
                                    height: 140,
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          opacity: 0.7,
                                          image: AssetImage(
                                              'assets/images/stethoscope.gif'),
                                          fit: BoxFit.cover),
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: /* Text(
                                      '  Nearby\nHospitals',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),*/
                                        Text(
                                      ' Care\nCritics',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          letterSpacing: 1.2,
                                          //decoration: TextDecoration.underline,
                                          decorationThickness: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmergencyPage()));
                                  },
                                  child: Container(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            opacity: 0.7,
                                            image: AssetImage(
                                                'assets/images/ambulance.gif'),
                                            fit: BoxFit.cover),
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: /*Text(
                                      'Emergency',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),*/
                                          Text(
                                        'Emergency\n    Posts',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            letterSpacing: 1.2,
                                            //decoration: TextDecoration.underline,
                                            decorationThickness: 2.0,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              )));
  }

  Widget buildImage(String image, int index, String name) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            imageUrl: image,
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(top: 170.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
            child: Text(
              name,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: SlideEffect(
            dotColor: Colors.black,
            dotWidth: 15,
            dotHeight: 15,
            activeDotColor: Colors.cyan),
      );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                image,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              child: Center(
                  child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc, url;
  BlogTile(
      {required this.desc,
      required this.imageUrl,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ))),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          desc,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
