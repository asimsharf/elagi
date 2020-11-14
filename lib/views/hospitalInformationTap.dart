import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class HospitalInfomationTap extends StatefulWidget {
  @override
  _HospitalInfomationTapState createState() => _HospitalInfomationTapState();
}

class _HospitalInfomationTapState extends State<HospitalInfomationTap> {
  final List<String> _tapSelector = [
    'شركات التأمين',
    'تقييم الزائريين',
    'الاطباء',
    'عن العيادات',
  ];

  var _currentIndex = 0;
  bool _isSelected;

  List<Widget> _buildTapSelected() {
    return _tapSelector.map((taps) {
      var index = _tapSelector.indexOf(taps);

      _isSelected = _currentIndex == index;

      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
          child: Center(
            child: Text(
              taps,
              style: TextStyle(
                color: _isSelected ? Colors.greenAccent : Colors.black,
                fontSize: _isSelected ? 18 : 16,
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: Column(
        children: <Widget>[
          Container(
            width: 500,
            height: 40,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _buildTapSelected(),
            ),
          ),
          SizedBox(height: 5),
          if (_currentIndex == 0)
            Center(
              child: Text(
                'لا توجد شركات تأمين ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
            ),
          if (_currentIndex == 1)
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, i) => VisitorRating(),
              ),
            ),
          if (_currentIndex == 2)
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, i) => DoctorCard(),
              ),
            ),
          if (_currentIndex == 3)
            Expanded(
              child: AboutHospital(),
            ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/placeholder.png",
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'دكتور غسان ندورة',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text(
                        'انضم حديثا',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        child: FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star_half, color: Colors.orange),
                              Icon(Icons.star_border, color: Colors.orange),
                              Icon(Icons.star_border, color: Colors.orange),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'الكشف : 100 جنيه',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  Text(
                    'الفرع :الميدان',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  Text(
                    'لا توجد مواعيد متاحة',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VisitorRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'السبت 20 ابريل 2020',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                  ),
                ),
                Transform.translate(
                  offset: Offset(-13, 0.0),
                  child: Text(
                    'وائل خيري',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 100,
              child: FittedBox(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.orange),
                    Icon(Icons.star, color: Colors.orange),
                    Icon(Icons.star_half, color: Colors.orange),
                    Icon(Icons.star_border, color: Colors.orange),
                    Icon(Icons.star_border, color: Colors.orange),
                  ],
                ),
              ),
            ),
            Text(
              'قام بزيارة دكتور ايمن عبدالحمن ',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
              ),
            ),
            Transform.translate(
              offset: Offset(-15, 0.0),
              child: Text(
                'اخصائي جراحة القلب',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-12, 0.0),
                  child: Text(
                    'عن العيادات',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ),
                Text(
                  'مركز متخصص بالاسنان',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-2, 0.0),
                  child: Text(
                    'فروع العيادات',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ),
                Text(
                  ' فـرع الميدان *',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-2, 0.0),
                  child: Text(
                    ' التخصصات',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ),
                Text(
                  'اسنان',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
