import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormUpdateRtlhController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nik_rtlh = TextEditingController(); //nik
  TextEditingController nkk_rtlh = TextEditingController(); //nama
  TextEditingController alamat_rtlh = TextEditingController(); //alamat
  final List<JenisKelamin> jk = [
    JenisKelamin(nama: 'Laki-Laki', val: 1),
    JenisKelamin(nama: 'Perempuan', val: 2)
  ]; //jenis kelamin
  TextEditingController umur_rtlh = TextEditingController(); //umur
  TextEditingController jml_rtlh = TextEditingController(); //jml anggota
  TextEditingController jml_k_rtlh = TextEditingController(); //jml kk
  TextEditingController sejahtera_rtlh =
      TextEditingController(); //status sejahtera

  final jk_rtlh = ''.obs;
  final progres_bar = 0.0.obs;
}

class JenisKelamin {
  String nama;
  int val;

  JenisKelamin({this.nama, this.val});
}
