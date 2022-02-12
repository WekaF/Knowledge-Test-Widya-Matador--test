import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matador_apptest/core/modules/controller/userC.dart';
import 'package:matador_apptest/core/modules/pages/addeditpage.dart';
import 'package:matador_apptest/core/modules/pages/widgets/customappbar.dart';
import 'package:matador_apptest/core/utils/const.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final pp = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: cPrimary,
            )),
        backgroundColor: cWhite,
        elevation: 0,
        title: Text(
          'Detail User',
          style: GoogleFonts.poppins(color: cPrimary, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    child: Text(
                      pp.namalengkapc.text[0],
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              profilewidget(
                hint: pp.namalengkapc.text,
                label: 'Nama Lengkap',
              ),
              profilewidget(
                hint: pp.panggilanc.text,
                label: 'Panggilan',
              ),
              profilewidget(
                hint: pp.nohpc.text,
                label: 'Nomer Hp',
              ),
              profilewidget(
                hint: pp.emailc.text,
                label: 'Email',
              ),
              profilewidget(
                hint: pp.alamatc.text,
                label: 'Alamat',
              ),
              profilewidget(
                hint: pp.pekerjaanc.text,
                label: 'Pekerjaan',
              ),
              profilewidget(
                hint: pp.jeniskelaminc.text,
                label: 'Jenis Kelamin',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class profilewidget extends StatelessWidget {
  final String hint;
  final String label;
  const profilewidget({
    Key? key,
    required this.hint,
    required this.label,
  }) : super(key: key);

  // final UserController pp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: hint,
              labelStyle: TextStyle(color: cBlack),
              enabled: false,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: cBlack,
                  width: 10.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

