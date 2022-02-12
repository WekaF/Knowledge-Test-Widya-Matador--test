import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matador_apptest/core/utils/const.dart';

// ignore: camel_case_types
class custformNohp extends StatelessWidget {
  const custformNohp({
    Key? key,
    this.validator,
    required this.controller,
    required this.focusNode,
    this.hint,
    this.title,
    this.autovalide,
    this.inputType,
    this.inputFormatter,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hint;
  final String? title;
  final FormFieldValidator? validator;
  final AutovalidateMode? autovalide;
  final TextInputType? inputType;
  final TextInputFormatter? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.only(left: 20, right: 20),
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
                  offset: const Offset(9, 7),
                ),
              ],
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              autovalidateMode: autovalide,
              validator: validator,
              decoration: InputDecoration(
                  prefixText: '+62 ',
                  border: const UnderlineInputBorder(
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
