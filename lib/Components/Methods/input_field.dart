import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sarafi_zaitoon/Components/colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final FormFieldValidator? validator;
  final TextEditingController controller;
  final double width;
  const InputField({super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.validator,
    this.width = .9,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * width,
      child: TextFormField(
           controller: controller,
           validator: validator,
           decoration: InputDecoration(
             prefixIcon: Icon(icon),
             hintText: Locales.string(context, label),
             enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
             focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8),
                 borderSide: const BorderSide(
                     color: primaryColor,
                     width: 1.5
                 )
             ),
             labelStyle: const TextStyle(color: primaryColor),
               hintStyle: const TextStyle(color: Colors.black54),

               label: LocaleText(label)
        ),
      ),
    );
  }
}
