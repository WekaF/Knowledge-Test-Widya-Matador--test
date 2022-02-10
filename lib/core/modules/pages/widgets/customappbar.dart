
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custappbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  custappbar(this.title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          )),
      centerTitle: true,
      elevation: 0,
      backgroundColor: const Color(0xff3355E9),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

