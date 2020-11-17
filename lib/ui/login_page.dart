import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../widget/dialog_widget.dart';
import 'package:slide_button/slide_button.dart';
import 'package:slider_button/slider_button.dart';
import '../controller/login_controller.dart';
import '../config/config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPass = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController ctrlUser = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  final LoginController login = Get.put(LoginController());
  double padd = 50;
  double padd2 = 50;

  double smallCircle(BuildContext ctx) => MediaQuery.of(ctx).size.width * 2 / 3;
  double bigCircle(BuildContext ctx) => MediaQuery.of(ctx).size.width * 7 / 8;

  animated() async {
    await Future.delayed(Duration(milliseconds: 100), () {
      return setState(() {
        padd = 0;
      });
    });

    await Future.delayed(Duration(milliseconds: 500), () {
      return setState(() {
        padd2 = 0;
      });
    });
  }

  void cekAuth() {
    String user = ctrlUser.text;
    String pass = ctrlPass.text;
    login.cekAuth(user, pass, context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animated();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo/logo_rtlh_red.png'),
      ),
    );

    final logo2 = Container(
      height: (MediaQuery.of(context).size.width * 1 / 3) + 20,
      child: AnimatedPadding(
        curve: Curves.elasticOut,
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(padd),
        child: Image(
          image: AssetImage('assets/logo/logo_rtlh_clr.png'),
        ),
      ),
    );

    final user = TextFormField(
      style: TextStyle(fontSize: getSizeH7(context), color: redColor),
      controller: ctrlUser,
      // maxLength: 50,
      keyboardType: TextInputType.text,
      autofocus: false,
      // initialValue: 'rafho@gmail.com',
      decoration: InputDecoration(
        fillColor: Color.fromARGB(150, 255, 255, 255),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Colors.grey[900],
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),

        // icon: Icon(Icons.mail),
        //untuk manambahkan widget bebas ke dalam field
        // prefix: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(30.0),
        //     color: Colors.red,
        //     border: Border.all(
        //       width: 2.0,
        //       color: Colors.black,
        //     ),
        //   ),
        //   width: 10.0,
        //   height: 10.0,
        //   // color: Colors.red,
        //   margin: EdgeInsets.only(right: 20.0),
        // ),
        prefixIcon: Icon(Icons.person),
        // prefixText: 'Email',
        // prefixStyle: TextStyle(color: Colors.red),
        labelText: 'Username',
        labelStyle: TextStyle(fontSize: getSizeH7(context)),
        // hintText: 'Email',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Username harus diisi!';
        }
        return null;
      },
      // onChanged: (val) {
      //   setState(() {});
      // },
    );

    final password = TextFormField(
        style: TextStyle(fontSize: getSizeH7(context), color: redColor),
        controller: ctrlPass,
        obscureText: showPass,
        autofocus: false,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(150, 255, 255, 255),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Colors.grey[900],
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          // icon: Icon(Icons.lock),
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: (showPass == false)
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                showPass = !showPass;
              });
            },
          ),
          labelText: 'Password',
          labelStyle: TextStyle(fontSize: getSizeH7(context)),
          // hintText: 'Password',
          // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
        validator: (val) {
          if (val.isEmpty) {
            return 'Password harus diisi!';
          }
          return null;
        });

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.black12,
              offset: Offset(0, 5.0),
            ),
          ],
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          minWidth: 200.0,
          // height: 45.0,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              cekAuth();
            }
          },
          // color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              Obx(
                () => (login.loading.value)
                    ? SpinKitFadingCircle(
                        color: Colors.white,
                        size: 25.0,
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );

    final slideButtonLogin = SlideButton(
      height: 64,
      slidingChild: Align(
        alignment: Alignment.centerRight,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.chevron_right)),
      ),
      backgroundColor: Colors.white,
      slidingBarColor: Colors.blue,
      slideDirection: SlideDirection.RIGHT,
    );

    final sliderButton = SliderButton(
      action: () {
        if (_formKey.currentState.validate()) {
          cekAuth();
        }
      },
      width: MediaQuery.of(context).size.width * 0.8,
      shimmer: true,
      dismissible: false,
      dismissThresholds: 0.6,
      vibrationFlag: true,
      child: Container(
        height: getWidth(context) / 100 * 14.6, //60
        width: getWidth(context) / 100 * 14.6, //60
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.black12,
              offset: Offset(0, 5.0),
            ),
          ],
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          // minWidth: 200.0,
          // height: 60.0,
          // color: Colors.orange,
          onPressed: () {},
          child: Obx(() => (login.loading.value)
              ? SpinKitFadingCircle(
                  color: Colors.white,
                  size: getWidth(context) / 100 * 8.55, //35
                )
              : Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                  size: getWidth(context) / 100 * 9.75, //40
                )),
        ),
      ),

      ///Put label over here
      label: Text(
        "Slide button to login",
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
          fontSize: getWidth(context) / 100 * 4.2, //17
        ),
      ),
      icon: Center(
          child: Icon(
        Icons.login_rounded,
        color: Colors.white,
        size: getWidth(context) / 100 * 9.75, //40
        semanticLabel: 'Text to announce in accessibility modes',
      )),

      ///Change All the color and size from here.
      // width: 230,
      radius: 50,
      buttonColor: Colors.red[800],
      // alignLabel: Alignment.center,
      backgroundColor: Colors.grey[300],
      highlightedColor: Colors.white,
      baseColor: Colors.red,
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final forms = Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          logo2,
          SizedBox(height: 38.0),
          user,
          SizedBox(height: 20.0),
          password,
          SizedBox(height: 24.0),
          // loginButton,
          sliderButton,
          // forgotLabel,
          // SizedBox(height: 10.0),
          // Text(ctrlEmail.text, textAlign: TextAlign.center),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFe4ebef),
      body: DoubleBackToCloseApp(
        snackBar: closeSnackBar(),
        child: Stack(children: <Widget>[
          Positioned(
            right: -smallCircle(context) / 3,
            top: -smallCircle(context) / 2,
            child: Container(
              width: smallCircle(context),
              height: smallCircle(context),
              child: Image.asset('assets/logo/logo_rtlh_none_wth.png'),
            ),
          ),
          Positioned(
            right: bigCircle(context) / 1.5,
            bottom: bigCircle(context) / 6,
            child: Container(
              width: bigCircle(context) / 2,
              height: bigCircle(context),
              child: Image.asset('assets/logo/logo_rtlh_none_wth.png'),
            ),
          ),
          Positioned(
            right: -bigCircle(context) / 3,
            bottom: -bigCircle(context) / 4,
            child: Container(
              width: bigCircle(context),
              height: bigCircle(context),
              child: Image.asset('assets/logo/logo_rtlh_none_wth.png'),
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 34.0, right: 34.0),
              children: <Widget>[
                AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(padd2),
                  child: forms,
                )
              ],
            ),
          ),
          Obx(() => (login.loading.value)
              ? Container(
                  color: Colors.blueGrey.withOpacity(0.3),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SpinKitWave(
                    color: redColor,
                    size: 35.0,
                  ),
                )
              : Container()),
        ]),
      ),
    );
  }
}
