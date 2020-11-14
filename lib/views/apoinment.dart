import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class Apointment extends StatefulWidget {
  @override
  _ApointmentState createState() => _ApointmentState();
}

class _ApointmentState extends State<Apointment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            'المواعيد',
            style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 18,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
            ),
            tabs: [
              Tab(
                text: 'مواعيدي',
              ),
              Tab(text: 'عروضي'),
            ],
          ),
        ),
        body: TabBarView(children: [
          MyOpintment(),
          MyOffer(),
        ]),
      ),
    );
  }
}

class MyOpintment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "الاحد 28 يونيو 6:30 م",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                    child: Text(
                      "دكتور عاصم شرف الدين",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.lightBlue,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      "استشاري جراحة القلب",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                  ),
                  Divider(),
                  Center(
                    child: Text(
                      "تم إالغاء الحجز",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
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

class MyOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "عروضى",
          style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
    );
  }
}
