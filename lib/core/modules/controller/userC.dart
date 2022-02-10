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

  //recuperar notas para apresentar na tela inicial
  @override
  void onReady() async {
    super.onReady();
    getAll();
  }

  //recuperar todas as notas
  getAll() {
    load(true);
    repo.getAll().then((data) {
      userList.value = data;
      load(false);
    });
  }

  //tratar formulario para inclusao de uma nota
  addNote() {
    formKey.currentState?.reset();
    namalengkapc.text = '';
    panggilanc.text = '';
    nohpc.text = '';
    alamatc.text = '';
    emailc.text = '';
    pekerjaanc.text = '';
    jeniskelaminc.text ='';
    title = 'Add User';
    
    Get.to(() => const AddEditPage());
  }

  //tratar formulario para edicao de uma nota passando id via arguments
  editNote(User user) {
    namalengkapc.text = user.nama;
    panggilanc.text = user.panggilan;
    nohpc.text = user.nohp;
    emailc.text = user.email;
    alamatc.text = user.alamat;
    pekerjaanc.text = user.pekerjaan;
    jeniskelaminc.text = user.kelamin;

    title = 'Edit User';
    Get.to(() => const AddEditPage(), arguments: user.id);
  }

  //verificar se o formulario esta validado sem erros
  //e se um id de nota eh enviado para a tela de edicao
  //a nota sera atualizada, caso contrario sera criada uma nova nota
  editMode() {
   
    if (formKey.currentState!.validate()) {
      load(true);
      if (Get.arguments == null) {
        saveNote();
      } else {
        updateNote();
      }
    }
  }

void showUser(User user) {
    namalengkapc.text = user.nama;
    panggilanc.text = user.panggilan;
    nohpc.text = user.nohp;
    alamatc.text = user.alamat;
    pekerjaanc.text = user.pekerjaan ;
    emailc.text = user.email ;
    jeniskelaminc.text = user.kelamin;
    Get.to(() => const DetailPage());
  }
  //salvar uma nova nota
  saveNote() async {
    final note = User(
      nama: namalengkapc.text.trim(),
      panggilan: panggilanc.text.trim(),
      nohp: nohpc.text.trim(),
      pekerjaan: pekerjaanc.text.trim(),
      alamat: alamatc.text.trim(),
      email: emailc.text.trim(),
      kelamin: jeniskelaminc.text.trim(),
    );
    repo.save(note).then((data) {
      load(false);
      refreshNoteList();
    });
  }

  //atualizar uma nota existente cujo id eh recuperado via arguments
  updateNote() async {
    final note = User(
      id: Get.arguments,
      nama: namalengkapc.text.trim(),
      panggilan: panggilanc.text.trim(),
      nohp: nohpc.text.trim(),
      pekerjaan: pekerjaanc.text.trim(),
      alamat: alamatc.text.trim(),
      email: emailc.text.trim(),
      kelamin: jeniskelaminc.text.trim(),
    );
    repo.update(note).then((data) {
      load(false);
      refreshNoteList();
    });
  }

  //excluir nota via id
  deleteNote(int noteId) async {
    load(true);
    repo.delete(noteId).then((data) {
      load(false);
      refreshNoteList();
    });
  }

  // atualizar lista de notas apos uma inclusao, alteracao ou exclusao
  refreshNoteList() {
    // recuperar lista de notas
    getAll();
    //fechar dialog
    Get.back();
    //voltar para a lista de notas
    Get.back();
  }

  // // validar campo titulo
  // validarTitulo(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Preencha o campo Título.';
  //   }
  //   return null;
  // }

  // //validar campo conteudo
  // validarConteudo(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Preencha o campo Conteúdo.';
  //   }
  //   return null;
  // }
}