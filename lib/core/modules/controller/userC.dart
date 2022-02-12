import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matador_apptest/core/data/models/user.dart';
import 'package:matador_apptest/core/data/repo/repo.dart';
import 'package:matador_apptest/core/modules/pages/addeditpage.dart';
import 'package:matador_apptest/core/modules/pages/detailpage.dart';

class UserController extends GetxController {
  final RepoUser repo;
  UserController(this.repo);

  String title = '';

  RxBool load = false.obs;
  final userList = <User>[].obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namalengkapc = TextEditingController();
  final TextEditingController panggilanc = TextEditingController();
  final TextEditingController nohpc = TextEditingController();
  final TextEditingController emailc = TextEditingController();
  final TextEditingController alamatc = TextEditingController();
  final TextEditingController pekerjaanc = TextEditingController();
  final TextEditingController jeniskelaminc = TextEditingController();

  final namaf = FocusNode();
  final panggilanf = FocusNode();
  final nohpf = FocusNode();
  final alamatf = FocusNode();
  final pekerjaanf = FocusNode();
  final jenisKelaminf = FocusNode();
  final emailf = FocusNode();

  @override
  void onReady() async {
    super.onReady();
    getAll();
  }

  getAll() {
    load(true);
    repo.getAll().then((data) {
      userList.value = data;
      load(false);
    });
  }

  addUser() {
    formKey.currentState?.reset();
    namalengkapc.text = '';
    panggilanc.text = '';
    nohpc.text = '';
    alamatc.text = '';
    emailc.text = '';
    pekerjaanc.text = '';
    jeniskelaminc.text = '';

    Get.to(() => const AddEditPage());
  }

  editUser(User user) {
    namalengkapc.text = user.nama;
    panggilanc.text = user.panggilan;
    nohpc.text = user.nohp;
    emailc.text = user.email;
    alamatc.text = user.alamat;
    pekerjaanc.text = user.pekerjaan;
    jeniskelaminc.text = user.kelamin;

    Get.to(() => const AddEditPage(), arguments: user.id);
  }

  editMode() {
    if (formKey.currentState!.validate()) {
      load(true);
      if (Get.arguments == null) {
        saveUser();
      } else {
        updateUser();
      }
    }
  }

  void showUser(User user) {
    namalengkapc.text = user.nama;
    panggilanc.text = user.panggilan;
    nohpc.text = user.nohp;
    alamatc.text = user.alamat;
    pekerjaanc.text = user.pekerjaan;
    emailc.text = user.email;
    jeniskelaminc.text = user.kelamin;
    Get.to(() => const DetailPage());
  }

  saveUser() async {
    final user = User(
      nama: namalengkapc.text.trim(),
      panggilan: panggilanc.text.trim(),
      nohp: '+62 ' + nohpc.text.trim(),
      pekerjaan: pekerjaanc.text.trim(),
      alamat: alamatc.text.trim(),
      email: emailc.text.trim(),
      kelamin: jeniskelaminc.text.trim(),
    );
    repo.save(user).then((data) {
      load(false);
      userListRefresh();
    });
  }

  updateUser() async {
    final user = User(
      id: Get.arguments,
      nama: namalengkapc.text.trim(),
      panggilan: panggilanc.text.trim(),
      nohp: nohpc.text.trim(),
      pekerjaan: pekerjaanc.text.trim(),
      alamat: alamatc.text.trim(),
      email: emailc.text.trim(),
      kelamin: jeniskelaminc.text.trim(),
    );
    repo.update(user).then((data) {
      load(false);
      userListRefresh();
    });
  }

  deleteUser(int noteId) async {
    load(true);
    repo.delete(noteId).then((data) {
      load(false);
      userListRefresh();
    });
  }

  userListRefresh() {
    getAll();
    Get.back();
    Get.back();
  }

 
}
