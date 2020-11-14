import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'ملف الدكتور',
          style: TextStyle(
            fontFamily: ArabicFonts.Tajawal,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Card(
                elevation: 8,
                child: Stack(
                  alignment: Alignment.topCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                      width: double.infinity,
                      height: 420,
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 20),
                            Text(
                              'دكتور غسان ندورة',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(thickness: 1.0),
                            Text(
                              'استشاري الطب النفسي ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'نفسي متخصص في استشارات اسرية ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' نفسي اطفال ونفسي بالغين ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: FittedBox(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.star, color: Colors.orange),
                                    Icon(Icons.star, color: Colors.orange),
                                    Icon(Icons.star_half, color: Colors.orange),
                                    Icon(Icons.star_border,
                                        color: Colors.orange),
                                    Icon(Icons.star_border,
                                        color: Colors.orange),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              width: 200,
                              child: Card(
                                color: Colors.pink,
                                child: Center(
                                  child: Text(
                                    'التقييم العام من الزائرين',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Divider(thickness: 1.0),
                            Text(
                              'سعر الكشف',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '200 جنيه',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 30,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 35,
                      child: Text(
                        ' 55 مشاهدات',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 300,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'سنقوم وبتوصيلك للدكتورفي الموعد الذي قمت بأختياره الرجاء التأكد من ان هاتفك يعمل في الموعد المحدد',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // color: Colors.pink,
                        width: 400,
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (ctx, i) => Card(
                            elevation: 5,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 120,
                                    color: Colors.pink,
                                    child: Center(
                                      child: Text(
                                        'اليوم',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 120,
                                    color: Colors.white,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'من 9 :00 صباحا الى 11:30 مساءا',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 120,
                                    color: Colors.green,
                                    child: Center(
                                      child: Text(
                                        'احجز',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-18, 0.0),
                        child: Text(
                          ' معلومات عن الطبيب',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'اسشاري الطب النفسي ورئيس مركز النخيل للطب النفس ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
