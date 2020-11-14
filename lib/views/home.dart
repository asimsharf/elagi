import 'package:elagi/utils/route_argument.dart';
import 'package:elagi/views/apoinment.dart';
import 'package:elagi/views/offer.dart';
import 'package:elagi/widgets/fadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:elagi/views/servicesDetails.dart';
import '../utils/appStyles.dart';

class Home extends StatefulWidget {
  RouteArgument routeArgument;

  Home({this.routeArgument});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _tapSelector = [
    'صيدليات',
    'مركز صحي',
    'عيادات',
    'مختبرات',
  ];

  int _currentIndex = 0;
  bool _isSelected;

  List<Widget> _buildTapSelected() {
    return _tapSelector.map((taps) {
      var index = _tapSelector.indexOf(taps);

      _isSelected = _currentIndex == index;

      return Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
          child: Container(
            width: 95,
            height: 40,
            child: Center(
              child: Text(
                taps,
                style: TextStyle(
                  color: _isSelected ? AppStyles.lineColor(1) : Colors.black,
                  fontSize: _isSelected ? 15 : 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: _isSelected
                    ? AppStyles.lineColor(1)
                    : AppStyles.mainColor(1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "${widget.routeArgument.param}",
          style: AppStyles.txtAppBarStyle,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: AppStyles.mainColor(1),
              ),
              accountName: Text(
                "إسم المستخدم",
                style: AppStyles.drawerHeaderTxtColor,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              accountEmail: Row(
                children: <Widget>[
                  Text(
                    "رقم الهاتف",
                    style: AppStyles.drawerHeaderTxtColor,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              0.1,
              Card(
                elevation: 0.2,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  title: Text(
                    "الرئيسية",
                    style: AppStyles.drawerTxtColor,
                  ),
                  leading: Icon(
                    Icons.home,
                    color: AppStyles.iconColor(1),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: AppStyles.iconColor(1),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              0.3,
              Card(
                elevation: 0.2,
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    "الملف الشخصي",
                    style: AppStyles.drawerTxtColor,
                  ),
                  leading: Icon(
                    Icons.person,
                    color: AppStyles.iconColor(1),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: AppStyles.iconColor(1),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              0.5,
              Card(
                elevation: 0.2,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.scale,
                        duration: Duration(
                          seconds: 0,
                          milliseconds: 700,
                        ),
                        alignment: Alignment.center,
                        child: Offer(),
                      ),
                    );
                  },
                  title: Text(
                    "العروض (0)",
                    style: AppStyles.drawerTxtColor,
                  ),
                  leading: Icon(
                    Icons.local_offer,
                    color: AppStyles.iconColor(1),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: AppStyles.iconColor(1),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              0.7,
              Card(
                elevation: 0.2,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.scale,
                        duration: Duration(
                          seconds: 0,
                          milliseconds: 700,
                        ),
                        alignment: Alignment.center,
                        child: Apointment(),
                      ),
                    );
                  },
                  title: Text(
                    "مواعيدي",
                    style: AppStyles.drawerTxtColor,
                  ),
                  leading: Icon(
                    Icons.access_time_rounded,
                    color: AppStyles.iconColor(1),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: AppStyles.iconColor(1),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              0.9,
              Card(
                elevation: 0.2,
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    "الإعدادات",
                    style: AppStyles.drawerTxtColor,
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: AppStyles.iconColor(1),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: AppStyles.iconColor(1),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              1.1,
              Card(
                elevation: 0.2,
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    "إتصل بنا",
                    style: AppStyles.drawerTxtColor,
                  ),
                  leading: Icon(
                    Icons.call,
                    color: AppStyles.iconColor(1),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: AppStyles.iconColor(1),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              1.3,
              Card(
                elevation: 0.2,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      style: AppStyles.alertStyle,
                      title: AppStyles.appArName,
                      desc: "هل ترغب في عملة تسجيل الخروج؟",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "إلغاء",
                            style: AppStyles.txtBtnStyle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: AppStyles.btnColor(1),
                        ),
                        DialogButton(
                          child: Text(
                            "موافق",
                            style: AppStyles.txtBtnStyle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: AppStyles.btnColor(1),
                        )
                      ],
                    ).show();
                  },
                  title: Text(
                    "تسجيل خروج",
                    style: AppStyles.drawerTxtColor,
                  ),
                  trailing: Icon(
                    Icons.exit_to_app,
                    color: AppStyles.iconColor(1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 3,
                padding: const EdgeInsets.only(top: 0, left: 12.0, right: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                  color: AppStyles.lineColor(1),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              'المراكز والمستشفيات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              width: 500,
              height: 40,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildTapSelected(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: _buildServices(context),
          ),
        ],
      ),
    );
  }

  Widget _buildServices(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {

                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.scale,
                    duration: Duration(
                      seconds: 0,
                      milliseconds: 700,
                    ),
                    alignment: Alignment.center,
                    child: ServicesDetails(),
                  ),
                );

              },
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'صيدلية الأمل',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'لأمراض القلب',
                                style: TextStyle(
                                  fontSize: 10,
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
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(237, 237, 237, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.room,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'يبعد عنك 5 كم',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'التقيمات   (132)',
                                style: TextStyle(
                                  fontSize: 8,
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
                  ],
                ),
              ),
            ),
          ),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {

                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.scale,
                    duration: Duration(
                      seconds: 0,
                      milliseconds: 700,
                    ),
                    alignment: Alignment.center,
                    child: ServicesDetails(),
                  ),
                );
              },
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'مركز صحي الهيبات',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'لأمراض القلب',
                                style: TextStyle(
                                  fontSize: 10,
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
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(237, 237, 237, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.room,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'يبعد عنك 5 كم',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'التقيمات   (132)',
                                style: TextStyle(
                                  fontSize: 8,
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
                  ],
                ),
              ),
            ),
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.scale,
                    duration: Duration(
                      seconds: 0,
                      milliseconds: 700,
                    ),
                    alignment: Alignment.center,
                    child: ServicesDetails(),
                  ),
                );
              },
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'عيادة السعيد على السعيد',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'لأمراض القلب',
                                style: TextStyle(
                                  fontSize: 10,
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
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(237, 237, 237, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.room,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'يبعد عنك 5 كم',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'التقيمات   (132)',
                                style: TextStyle(
                                  fontSize: 8,
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
                  ],
                ),
              ),
            ),
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.scale,
                    duration: Duration(
                      seconds: 0,
                      milliseconds: 700,
                    ),
                    alignment: Alignment.center,
                    child: ServicesDetails(),
                  ),
                );
              },
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'مختبر دكتور فارما',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'لأمراض القلب',
                                style: TextStyle(
                                  fontSize: 10,
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
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(237, 237, 237, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.room,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'يبعد عنك 5 كم',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'التقيمات   (132)',
                                style: TextStyle(
                                  fontSize: 8,
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
                  ],
                ),
              ),
            ),
          ),
        );
    }
  }
}
