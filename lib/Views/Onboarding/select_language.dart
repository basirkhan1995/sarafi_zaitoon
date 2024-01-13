import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sarafi_zaitoon/Components/Methods/button.dart';
import 'package:sarafi_zaitoon/Components/colors.dart';
import 'package:sarafi_zaitoon/Views/Onboarding/onboarding_view.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  final ctrl = LanguageItems();
  int currentIndex = 0;
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height /4),
          const ListTile(
            title: LocaleText("select_language"),
          ),
          Expanded(
            child: Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ctrl.items.length,
                  itemBuilder: (context,index){
                    selectedItem = currentIndex == index;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedItem? primaryColor : Colors.grey,
                        width: selectedItem? 0 : 1
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedItem? primaryColor : Colors.transparent
                    ),
                    child: ListTile(
                      onTap: (){
                        setState(() {
                          currentIndex = index;
                          Locales.change(context, ctrl.items[index].localeCode);
                        });
                      },
                      leading: Icon(ctrl.items[index].icon,color: selectedItem?Colors.white:Colors.black54),
                      title: Text(ctrl.items[index].locale,style: TextStyle(color: selectedItem?Colors.white:Colors.black54),),
                      trailing: selectedItem? Icon(Icons.check,size: 20,color: selectedItem?Colors.white:Colors.black54) : const SizedBox(),
                    ),
                  );
              }),
            ),
          ),
          ZButton(label: "next", press: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const OnboardingUi()));
          }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

 class LanguageInfo {
  final String locale;
  final String localeCode;
  final IconData icon;

  LanguageInfo({required this.locale, required this.icon,required this.localeCode});
 }

 class LanguageItems{
  List<LanguageInfo> items = [
    LanguageInfo(localeCode: "en", locale: "English", icon: Icons.language),
    LanguageInfo(localeCode: "fa", locale: "فارسی", icon: Icons.language),
    LanguageInfo(localeCode: "ps", locale: "پشتو", icon: Icons.language),
  ];
 }
