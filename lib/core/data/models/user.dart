import 'dart:convert';

class User {
  int? id;
  String nama;
  String panggilan;
  String alamat;
  String nohp;
  String kelamin;
  String pekerjaan;
  String email;

  User(
      {this.id,
      required this.nama,
      required this.panggilan,
      required this.nohp,
      required this.alamat,
      required this.pekerjaan,
      required this.kelamin,
      required this.email});

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data["id"] ?? '', 
        nama: data["nama"] ?? '',
        panggilan: data["panggilan"] ?? '',
        alamat: data["alamat"] ?? '',
        nohp: data["nohp"].toString(),
        email: data["email"] ?? '',
        kelamin: data["kelamin"] ?? '',
        pekerjaan: data["pekerjaan"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "panggilan": panggilan,
        "alamat": alamat,
        "nohp": nohp.toString(),
        "email": email,
        "pekerjaan": pekerjaan,
        "kelamin" : kelamin
      };

  User copy({
    int? id,
    String? nama,
    String? panggilan,
    String? alamat,
    String? nohp,
    String? kelamin,
    String? pekerjaan,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
       nama: nama ?? this.nama,
       panggilan: panggilan ?? this.panggilan,
       alamat: alamat ?? this.alamat,
       pekerjaan: pekerjaan ?? this.pekerjaan,
       kelamin: kelamin ?? this.kelamin,
       email: email ?? this.email,
       nohp: nohp ?? this.nohp,
      );


    List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToMap(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}
