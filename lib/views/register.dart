import 'package:country_code_picker/country_code_picker.dart';
import 'package:elagi/controllers/parse_result.dart';
import 'package:elagi/controllers/store.dart';
import 'package:elagi/utils/appStyles.dart';
import 'package:elagi/views/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sweetalert/sweetalert.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final nameController = new TextEditingController();
  final phoneController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final cPasswordController = new TextEditingController();

  final regionCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  final store = Store(PhoneNumber());
  String dialCode;
  String regionCode;
  Future<ParseResult> parse() async {
    return await store.parse(phoneController.text, region: regionCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 15, left: 15),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                height: 150,
                width: 150,
                child: Image.asset(
                  "assets/images/logo_transparent.png",
                ),
              ),
            ),

            ///full name
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: nameController,
              decoration: InputDecoration(
                labelText: "الإسم بالكامل",
                labelStyle: AppStyles.txtLabelStyle,
                hintStyle: AppStyles.txtHintStyle,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.teal,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            ///mobile number
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "رقم الجوال",
                labelStyle: AppStyles.txtLabelStyle,
                hintStyle: AppStyles.txtHintStyle,
                prefixIcon: const Icon(
                  Icons.phone_iphone,
                  color: Colors.grey,
                ),
                suffixIcon: CountryCodePicker(
                  onChanged: (code) {
                    setState(() {
                      dialCode = code.dialCode;
                      regionCode = code.code;
                    });
                  },
                  onInit: (code) {
                    dialCode = code.dialCode;
                    regionCode = code.code;
                  },
                  initialSelection: 'SD',
                  favorite: ['+249', 'SD'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  textOverflow: TextOverflow.clip,
                  flagWidth: 30,
                  showFlagDialog: true,
                  showFlag: false,
                  textStyle: TextStyle(
                    fontSize: 12.0,
                    locale: Locale('en'),
                  ),
                  dialogTextStyle: TextStyle(
                    fontSize: 12.0,
                    locale: Locale('en'),
                  ),
                  searchStyle: TextStyle(
                    fontSize: 12.0,
                    locale: Locale('en'),
                  ),
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.teal,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            ///email address
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني",
                labelStyle: AppStyles.txtLabelStyle,
                hintStyle: AppStyles.txtHintStyle,
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.teal,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            ///password
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "كلمة المرور",
                labelStyle: AppStyles.txtLabelStyle,
                hintStyle: AppStyles.txtHintStyle,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.teal,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            ///confirm password
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: cPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "تأكيد كلمة المرور",
                labelStyle: AppStyles.txtLabelStyle,
                hintStyle: AppStyles.txtHintStyle,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.teal,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100,
                  child: FlatButton(
                    textColor: AppStyles.btnColor(1),
                    color: Colors.transparent,
                    child: Text(
                      "دخول",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushNamed('/Login');
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.scale,
                      //     duration: Duration(
                      //       seconds: 0,
                      //       milliseconds: 700,
                      //     ),
                      //     alignment: Alignment.center,
                      //     child: Login(),
                      //   ),
                      // );
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: FlatButton(
                    textColor: AppStyles.btnColor(1),
                    color: Colors.transparent,
                    child: Text(
                      "تسجيل",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                    onPressed: () async {
                      if (nameController.text.isEmpty) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً يرجى إدخال الإسم الكامل",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (phoneController.text.isEmpty) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً يرجى إدخال رقم الهاتف",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (phoneController.text.length < 10) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً يجب ألا يقل رقم الهاتف من 10 أحرف",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (phoneController.text.length > 10) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً يجب ألا يزيد رقم الهاتف عن 10 أحرف",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (emailController.text.isEmpty) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً يرجى إدخال البريد الإلكتروني",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (!EmailValidator.validate(
                          emailController.text)) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً يرجى إدخال بريد إلكتروني صحيح",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (passwordController.text.isEmpty) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً يرجى إدخال كلمة المرور",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (passwordController.text.length < 6) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً كلمة المرور قصيرة جداً",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else if (cPasswordController.text !=
                          passwordController.text) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً كلمة المرور غير متطابقة",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else {
                        parse().then((phone) {
                          Navigator.of(context).pushReplacementNamed('/Login');
                        //   Provider.of<AuthProvider>(context, listen: false)
                        //       .register(
                        //     scaffoldKey: _scaffoldKey,
                        //     name: nameController.text,
                        //     phone: phone.e164,
                        //     email: emailController.text,
                        //     password: passwordController.text,
                        //     cPassword: cPasswordController.text,
                        //   );
                        });
                      }
                    },
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
