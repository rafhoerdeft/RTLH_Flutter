import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtlh_app/model/daftar_rtlh_model.dart';

class DaftarRtlhController extends GetxController {
  final daftar_rtlh = [].obs;

  final formKey = GlobalKey<FormState>();
  TextEditingController ctrlCari = TextEditingController();

  @override
  void onInit() {
    daftarRtlh();
  }

  void daftarRtlh() {
    daftar_rtlh.value = [
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
    ];
  }
}
