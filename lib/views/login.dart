import 'package:country_code_picker/country_code_picker.dart';
import 'package:elagi/controllers/parse_result.dart';
import 'package:elagi/controllers/store.dart';
import 'package:elagi/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sweetalert/sweetalert.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final phoneController = new TextEditingController();
  final passwordController = new TextEditingController();
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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 100),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "assets/images/logo_transparent.png",
                    ),
                  ),
                ),

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
              ],
            ),
          ),
        ],
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
                      if (phoneController.text.isEmpty) {
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
                      } else if (passwordController.text.length < 6) {
                        SweetAlert.show(
                          context,
                          subtitle: "عفواً كلمة المرور قصيرة جداً",
                          confirmButtonText: "موافق",
                          style: SweetAlertStyle.error,
                          confirmButtonColor: AppStyles.btnColor(1),
                        );
                      } else {
                        parse().then((phone) {
                          Navigator.of(context)
                              .pushReplacementNamed('/OtpVerify');
                          //   Provider.of<AuthProvider>(context, listen: false)
                          //       .login(
                          //     scaffoldKey: _scaffoldKey,
                          //     phone: phone.e164,
                          //     password: passwordController.text,
                          //   );
                        });
                      }
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
                      Navigator.of(context).pushNamed('/Register');
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.scale,
                      //     duration: Duration(
                      //       seconds: 0,
                      //       milliseconds: 700,
                      //     ),
                      //     alignment: Alignment.center,
                      //     child: Register(),
                      //   ),
                      // );
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
