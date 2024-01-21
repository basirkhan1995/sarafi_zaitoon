import 'package:flutter/material.dart';
import 'package:sarafi_zaitoon/Views/BottomNavBar/Views/account.dart';
import 'package:sarafi_zaitoon/Views/BottomNavBar/Views/dashboard.dart';
import 'package:sarafi_zaitoon/Views/BottomNavBar/Views/settings.dart';

 class NavInfo{
   final String title;
   final IconData icon;
   final Widget page;

   NavInfo({required this. title, required this.icon, required this.page});
 }

 class NavItems{
   List<NavInfo> items = [
     NavInfo(
         title: "dashboard",
         icon: Icons.dashboard_customize_rounded,
         page: const Dashboard(),
     ),

     NavInfo(
       title: "accounts",
       icon: Icons.account_circle_rounded,
       page: const Accounts(),
     ),

     NavInfo(
       title: "transactions",
       icon: Icons.ssid_chart,
       page: const Settings(),
     ),

     NavInfo(
       title: "currency_rate",
       icon: Icons.currency_rupee_rounded,
       page: const Accounts(),
     ),

   ];
 }