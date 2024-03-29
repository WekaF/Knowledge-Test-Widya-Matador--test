import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matador_apptest/core/modules/controller/userC.dart';
import 'package:matador_apptest/core/modules/pages/widgets/customappbar.dart';
import 'package:matador_apptest/core/modules/pages/widgets/customform.dart';
import 'package:matador_apptest/core/modules/pages/widgets/customformNumber.dart';
import 'package:matador_apptest/core/modules/pages/widgets/customformemail.dart';
import 'package:matador_apptest/core/utils/const.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({Key? key}) : super(key: key);

  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final controller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: custappbar('Add User'),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                custform(
                  controller: controller.namalengkapc,
                  focusNode: controller.namaf,
                  hint: 'Masukkan Nama',
                  title: 'Nama',
                ),
                custform(
                  controller: controller.panggilanc,
                  focusNode: controller.panggilanf,
                  hint: 'Masukkan Panggilan',
                  title: 'Panggilan',
                ),

                custformNohp(
                  title: 'Nomer Hp',
                  hint: 'Masukkan Nomer Hp',
                  controller: controller.nohpc,
                  focusNode: controller.nohpf,
                  inputType: TextInputType.number,
                ),

                // custform(
                //   controller: controller.emailc,
                //   focusNode: controller.emailf,
                //   hint: 'Masukkan Email',
                //   title: 'Email',
                // ),
                custformemail(
                  controller: controller.emailc,
                  focusNode: controller.emailf,
                  hint: 'Masukkan Email',
                  title: 'Email',
                ),
                custform(
                  controller: controller.alamatc,
                  focusNode: controller.alamatf,
                  hint: 'Masukkan Alamat',
                  title: 'Alamat',
                ),
                custform(
                  controller: controller.pekerjaanc,
                  focusNode: controller.pekerjaanf,
                  hint: 'Masukkan Pekerjaan',
                  title: 'Pekerjaan',
                ),
                custform(
                  controller: controller.jeniskelaminc,
                  focusNode: controller.jenisKelaminf,
                  hint: 'Masukkan Jenis Kelamin',
                  title: 'Jenis Kelamin',
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 160,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: cPrimary,
                            textStyle: GoogleFonts.poppins(fontSize: 16),
                          ),
                          onPressed: () {
                            validateData();
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateData() {
    if (controller.formKey.currentState!.validate()) {
      controller.editMode();
    } else {
      Get.snackbar(
        "Peringatan",
        "Semua Data Harus Diisi.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: cPrimary,
        ),
        colorText: cPrimary,
      );
    }
  }
}
