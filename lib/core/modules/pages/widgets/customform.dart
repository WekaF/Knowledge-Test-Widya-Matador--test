
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matador_apptest/core/utils/const.dart';

class custform extends StatelessWidget {
  const custform({
    Key? key,
    this.validator,
    required this.controller,
    required this.focusNode,
    this.hint, this.title, this.autovalide, this.inputType,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hint;
  final String? title;
  final FormFieldValidator? validator;
  final AutovalidateMode? autovalide;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           title!,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 8),
            
            decoration: BoxDecoration(
              color: cWhite,
              boxShadow: [
                 BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 12,
            offset: Offset(9, 7),
          ),
              ],
              
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
            keyboardType: inputType,
              autovalidateMode: autovalide,
              validator: validator,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                  // labelText: 'nama',
                  hintText: hint),
              controller: controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.next,
             
            ),
          ),
        ],
      ),
    );
  }
}
