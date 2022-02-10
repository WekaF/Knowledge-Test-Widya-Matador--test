import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matador_apptest/core/modules/controller/userC.dart';
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
      appBar: custappbar('Detail Page'),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 1.02,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: cPrimary
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          child: Center(child: Text(pp.namalengkapc.text[0], style: TextStyle(fontSize: 32),),),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pp.namalengkapc.text,
                              style: nameProfile
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              pp.nohpc.text,
                              style: phoneProfie,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              profilecard(
                title: 'Alamat Email',
                value: pp.emailc.text,
              ),
              profilecard(
                title: 'Username',
                value: pp.panggilanc.text,
              ),
              profilecard(
                title: 'Pekerjaan',
                value: pp.pekerjaanc.text,
              ),
              profilecard(title: 'Jenis Kelamin', value: pp.jeniskelaminc.text),
            ],
          ),
        ),
      ),
    );
  }
}

class profilecard extends StatelessWidget {
  final String title;
  final String value;

  const profilecard({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 50,
      width: MediaQuery.of(context).size.width / 1.02,
      decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 7,
                offset: Offset(9, 5)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
