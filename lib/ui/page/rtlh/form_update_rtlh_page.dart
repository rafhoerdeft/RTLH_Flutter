import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rtlh_app/config/config.dart';
import 'package:rtlh_app/controller/form_update_rtlh_controller.dart';

class FormUpdateRtlhPage extends StatefulWidget {
  @override
  _FormUpdateRtlhPageState createState() => _FormUpdateRtlhPageState();
}

class _FormUpdateRtlhPageState extends State<FormUpdateRtlhPage> {
  final FormUpdateRtlhController fup = Get.put(FormUpdateRtlhController());

  final id_rtlh = Get.parameters['id'];
  @override
  Widget build(BuildContext context) {
    var txtNik = TextFormField(
      controller: fup.nik_rtlh,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.credit_card),
        labelText: 'NIK',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtNama = TextFormField(
      controller: fup.nkk_rtlh,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Nama',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtAlamat = TextFormField(
      controller: fup.alamat_rtlh,
      keyboardType: TextInputType.text,
      maxLines: 3,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home),
        labelText: 'Alamat',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtUmur = TextFormField(
      controller: fup.umur_rtlh,
      maxLength: 3,
      keyboardType: TextInputType.number,
      autofocus: false,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_add_alt_1),
        labelText: 'Umur',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var selectJk = DropdownButtonFormField(items: null, onChanged: null);

    var btnSave = AnimatedButton(
      pressEvent: () {
        if (fup.formKey.currentState.validate()) {}
      },
      text: 'Simpan',
      width: double.infinity,
      color: redColor,
      icon: Icons.save,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    var formUpdate = Form(
      key: fup.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          txtNik,
          txtNama,

          SizedBox(height: 20),
          btnSave,
          // SizedBox(height: 10),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data RTLH'),
      ),
      body: formUpdate,
    );
  }
}
