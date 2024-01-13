 import 'package:flutter/material.dart';

import 'onboarding_info.dart';

 class OnboardingItems{
   List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "money_exchange",
        descriptions: "money_exchange_details",
        image: "assets/onboarding/onboarding1.gif"),
     OnboardingInfo(
         title: "money_transfer",
         descriptions: "money_transfer_details",
         image: "assets/onboarding/onboarding1.gif"),
     OnboardingInfo(
         title: "safe_transfer",
         descriptions: "safe_transfer_details",
         image: "assets/onboarding/onboarding1.gif"),
   ];
 }