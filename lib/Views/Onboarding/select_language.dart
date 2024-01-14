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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const LocaleText("select_language",style: TextStyle(fontSize: 22),),
            SizedBox(
                height: MediaQuery.of(context).size.height*.4,
                width: MediaQuery.of(context).size.width *.8,
                child: Image.asset("assets/photos/locale.gif")),
            Expanded(
              flex: 2,
              child: Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ctrl.items.length,
                    itemBuilder: (context,index){
                      selectedItem = currentIndex == index;
                    return Container(
                      height: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: selectedItem? primaryColor : Colors.grey.withOpacity(.2)
                      ),
                      child: Center(
                        child: ListTile(
                          onTap: (){
                            setState(() {
                              currentIndex = index;
                              Locales.change(context, ctrl.items[index].localeCode);
                            });
                          },
                          //leading: Icon(ctrl.items[index].icon,color: selectedItem?Colors.white:Colors.black54),
                          title: Text(ctrl.items[index].locale,style: TextStyle(color: selectedItem?Colors.white:Colors.black54),),
                          trailing: selectedItem? Icon(Icons.check,size: 20,color: selectedItem?Colors.white:Colors.black54) : const SizedBox(),
                        ),
                      ),
                    );
                }),
              ),
            ),
            ZButton(
                width: .93,
                height: 60,
                label: "next", press: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const OnboardingUi()));
            }),
            const SizedBox(height: 10),
          ],
        ),
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
    LanguageInfo(localeCode: "en", locale: "English (United States)", icon: Icons.language),
    LanguageInfo(localeCode: "fa", locale: "فارسی", icon: Icons.language),
    LanguageInfo(localeCode: "ps", locale: "پشتو", icon: Icons.language),
  ];
 }
