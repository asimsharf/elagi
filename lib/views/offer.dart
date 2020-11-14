import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class Offer extends StatefulWidget {
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
        actionsIconTheme: Theme.of(context).accentIconTheme,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text(
          'العروض',
          style: TextStyle(
            color: Colors.white,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      width: 120.0,
                      height: 40.0,
                      bottom: 0.0,
                      left: 0.0,
                      child: Card(
                        elevation: 3.0,
                        color: Colors.pink,
                        child: Center(
                          child: Text(
                            'الخصم (60%)',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      width: 230.0,
                      height: 40.0,
                      bottom: 0.0,
                      right: 0.0,
                      child: Card(
                        color: Colors.black38,
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage(
                                'assets/images/placeholder.png',
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'عيادة مرام ميمون - السويدي',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'تحديد الدقن لللرجالئ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                      Text(
                        "1 جلسة تحديد الدقن بالليزر",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                      Text(
                        "الجهاز : جنتل برو",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                      Container(
                        width: 97,
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
                      Row(
                        children: <Widget>[
                          Text(
                            'السعر',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '100 ريال',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          Spacer(),
                          Card(
                            elevation: 3.0,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 5.0,
                                bottom: 5.0,
                              ),
                              child: Center(
                                child: Text(
                                  "احجز",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
