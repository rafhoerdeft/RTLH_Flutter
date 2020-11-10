import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../widget/dialog_widget.dart';
import 'package:slide_button/slide_button.dart';
import 'package:slider_button/slider_button.dart';
import '../controller/login_controller.dart';

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
      height: 120,
      child: AnimatedPadding(
        curve: Curves.elasticOut,
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(padd),
        child: Image(
          image: AssetImage('assets/logo/logo_rtlh_red.png'),
        ),
      ),
    );

    final user = TextFormField(
      controller: ctrlUser,
      // maxLength: 50,
      keyboardType: TextInputType.text,
      autofocus: false,
      // initialValue: 'rafho@gmail.com',
      decoration: InputDecoration(
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
        // labelStyle: TextStyle(fontSize: 20.0),
        // hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
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
        controller: ctrlPass,
        obscureText: showPass,
        autofocus: false,
        decoration: InputDecoration(
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
          // hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
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
        height: 60.0,
        width: 60.0,
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
                  size: 35.0,
                )
              : Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                  size: 40.0,
                )),
        ),
      ),

      ///Put label over here
      label: Text(
        "Slide button to login",
        style: TextStyle(
            color: Colors.grey[600], fontWeight: FontWeight.w500, fontSize: 17),
      ),
      icon: Center(
          child: Icon(
        Icons.power_settings_new,
        color: Colors.white,
        size: 40.0,
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
      // backgroundColor: Colors.white,
      body: DoubleBackToCloseApp(
        snackBar: closeSnackBar(),
        child: Stack(children: <Widget>[
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 34.0, right: 34.0),
              children: <Widget>[
                AnimatedPadding(
                    duration: Duration(seconds: 1),
                    padding: EdgeInsets.all(padd2),
                    child: forms)
              ],
            ),
          ),
          Obx(() => (login.loading.value)
              ? Container(
                  color: Colors.blueGrey.withOpacity(0.3),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SpinKitWave(
                    color: Colors.blue,
                    size: 35.0,
                  ),
                )
              : Container()),
        ]),
      ),
    );
  }
}
