import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matador_apptest/core/data/models/user.dart';
import 'package:matador_apptest/core/utils/const.dart';

class cutscard extends StatelessWidget {
  final User? user;
  cutscard(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width / 1.1,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: cWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 12,
            offset: Offset(9, 7),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            child: CircleAvatar(
              child: Center(
                child: Text(
                  user!.nama[0],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user?.nama ?? "",
                style: cardName
              ),
              Text(
                user?.nohp.toString() ?? "",
                style: cardPhone ,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
