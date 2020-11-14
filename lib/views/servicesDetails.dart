import 'package:elagi/utils/appStyles.dart';
import 'package:elagi/views/hospitalInformationTap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class ServicesDetails extends StatefulWidget {
  @override
  _ServicesDetailsState createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'بيانات المستشفى',
          style: AppStyles.txtAppBarStyle,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                  width: double.infinity,
                  height: 250,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'عيادات الميدان',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'التخصصات',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                  ),
                                ),
                                Text(
                                  '1 تخصص',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'الاطباء',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                  ),
                                ),
                                Text(
                                  '4 دكتور',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 30,
                  right: 30,
                  child: Text(
                    ' 7 مشاهدات',
                    style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        "assets/images/placeholder.png",
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  child: Container(
                    width: 200,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'احجز موعدك الان',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            HospitalInfomationTap(),
          ],
        ),
      ),
    );
  }
}
