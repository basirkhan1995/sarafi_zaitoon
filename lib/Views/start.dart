import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sarafi_zaitoon/Views/BottomNavBar/Components/nav_info.dart';

 class StartScreen extends StatefulWidget {
   const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}
class _StartScreenState extends State<StartScreen> {
   int currentIndex = 0;
   final controller = NavItems();
   final pageController = PageController();
   bool selectedItem = false;
   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     return Scaffold (
       appBar: AppBar(
       title: Text(controller.items[currentIndex].title),
       ),

       floatingActionButton: FloatingActionButton(
           onPressed: (){},
           child: const Icon(Icons.add),
       ),

       bottomNavigationBar: Container(
         margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
         decoration: BoxDecoration(
             color: Colors.deepPurple.withOpacity(.1),
             borderRadius: BorderRadius.circular(10)
         ),
         height: 65,
         child: ListView.builder(
             itemCount: 4,
             scrollDirection: Axis.horizontal,
             padding: EdgeInsets.symmetric(horizontal: size.width *.015),
             itemBuilder: (context,index)=>InkWell(
               splashColor: Colors.transparent,
               highlightColor: Colors.transparent,
               onTap: (){
                 setState(() {
                   currentIndex = index;
                 });
               },
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const SizedBox(height: 5),
                   Icon(controller.items[index].icon,size: currentIndex == index ? 26:24,color: currentIndex == index? Colors.deepPurple:Colors.black54),
                   LocaleText(controller.items[index].title,style: TextStyle(color: currentIndex == index? Colors.deepPurple:Colors.black54,fontSize: 12),),
                   AnimatedContainer(
                     duration: const Duration(milliseconds: 1500),
                     curve: Curves.fastLinearToSlowEaseIn,
                     width: size.width *.140,
                     height: currentIndex == index? 5:0,
                     margin: EdgeInsets.only(
                         right: size.width* .0422,
                         left: size.width* .0422,
                         top: currentIndex == index? size.width * .014:0),
                     decoration: const BoxDecoration(
                         color: Colors.deepPurple,
                         borderRadius: BorderRadius.vertical(
                             top: Radius.circular(20)
                         )
                     ),
                   )
                 ],
               ),
             )),
       ),

       body: PageView.builder(
           itemBuilder: (context,index){
             return SizedBox(
               child: controller.items[currentIndex].page,
             );
           })
     );
   }
}