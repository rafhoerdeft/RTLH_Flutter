import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/user_controller.dart';
import '../../ui/style/button_style.dart';
import '../../widget/button_widget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlAge = TextEditingController();
  final UserController usr = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final _name = TextFormField(
      controller: ctrlName,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Name',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Field must entry!';
        }
        return null;
      },
    );

    final _age = TextFormField(
      controller: ctrlAge,
      maxLength: 3,
      keyboardType: TextInputType.number,
      autofocus: false,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.portrait),
        labelText: 'Age',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Field must entry!';
        }
        return null;
      },
    );

    final _submit = RaisedButton(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Update User',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          usr.updateUser(ctrlName.text, int.parse(ctrlAge.text));
        }
      },
    );

    final _customBtn = ButtonWidget(
      btnStyle: buttonStyle.clone()
        // ..background.color(Colors.green[300])
        ..width(MediaQuery.of(context).size.width)
        // ..border(all: 3, color: Colors.green[900])
        ..rotate(0),
      btnGesture: Gestures()
        ..onTap(() {
          if (_formKey.currentState.validate()) {
            usr.updateUser(ctrlName.text, int.parse(ctrlAge.text));
          }
        }),
    );

    var _list = Center(
      child: ListView(
        padding: EdgeInsets.all(50),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _name,
                SizedBox(height: 10),
                _age,
                SizedBox(height: 10),
                // _submit,
                SizedBox(height: 10),
                _customBtn,
                SizedBox(height: 250),
                Obx(() => Text('Name: ${usr.user.value.name}')),
                Obx(() => Text('Age: ${usr.user.value.age}')),
              ],
            ),
          ),
        ],
      ),
    );

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            // floating: true,
            elevation: 4,
            // snap: true,
            automaticallyImplyLeading: false,
            // title: Text('MyApp'),
            pinned: false,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            expandedHeight:
                (MediaQuery.of(context).size.height * 1 / 3) * 1 / 1.5,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF2f2546),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hi, ',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Text(
                              'Rafho',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Butuh, Sawangan',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            //     Container(
            //   color: Colors.red,
            // ),
          ),
        ];
      },
      body: _list,
    );
  }
}
