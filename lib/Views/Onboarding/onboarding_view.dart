import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sarafi_zaitoon/Views/Authentication/Login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Components/colors.dart';
import '../hom.dart';
import 'onboarding_items.dart';

class OnboardingUi extends StatefulWidget {
  const OnboardingUi({super.key});

  @override
  State<OnboardingUi> createState() => _OnboardingUiState();
}

class _OnboardingUiState extends State<OnboardingUi> {
  final pageController = PageController();
  final controller = OnboardingItems();
  bool isLastPage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomSheet: isLastPage? getStartedBtn() : Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        height: 65,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: ()=>pageController.jumpToPage(controller.items.length -1),
                  child: const LocaleText("skip")),
              SmoothPageIndicator(
                effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  type: WormType.normal,
                  activeDotColor: primaryColor,
                  dotColor: Colors.grey.withOpacity(.5),
                ),
                controller: pageController,
                count: controller.items.length,
                onDotClicked: (index)=> pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),

              ),
              TextButton(onPressed: ()=>pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut), child: const LocaleText("next")),

            ],
          ),
        ),
      ),
      body: PageView.builder(
          controller: pageController,
          onPageChanged: (index)=>  setState(()=> isLastPage = controller.items.length -1 == index ),
          itemCount: controller.items.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image),
                  const SizedBox(height: 20),
                  LocaleText(controller.items[index].title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  const SizedBox(height: 10),
                  LocaleText(controller.items[index].descriptions,style: const TextStyle(fontSize: 18,color: Colors.grey),textAlign: TextAlign.center,)
                ],
              ),
            );
          }),
    );
  }
  Widget getStartedBtn(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child: TextButton(
        onPressed: ()async{
          if(!mounted)return;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
        },
        child: const LocaleText("get_started",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
