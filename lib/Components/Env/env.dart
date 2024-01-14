import 'package:flutter/material.dart';

 class Env{

   static goto(route,context){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>route));
   }
 }