import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sarafi_zaitoon/Components/colors.dart';

 class ZButton extends StatelessWidget {
   final String label;
   final VoidCallback press;
   const ZButton({super.key, required this.label, required this.press});

   @override
   Widget build(BuildContext context) {
     return Container(
       width: MediaQuery.of(context).size.width *9,
       decoration: BoxDecoration(
         color: primaryColor,
         borderRadius: BorderRadius.circular(8)
       ),
       height: 50,
       margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
       child: Center(
         child: TextButton(
           onPressed: press,
           child: LocaleText(label,style: const TextStyle(color: Colors.white)),
         ),
       ),
     );
   }
 }
