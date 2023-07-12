import 'package:flutter/material.dart';
import 'package:spotify_clone/BottomNavigation.dart';
import 'package:spotify_clone/Premium/widgets/CurrentPlan.dart';
import 'package:spotify_clone/Premium/widgets/buttons.dart';
import 'package:spotify_clone/Premium/widgets/carousel.dart';
import 'package:spotify_clone/Premium/widgets/premiumplan.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 150),
      body: ListView(
        children: [
          const SizedBox(
            height: 75,
          ),
          const Text(
            "Get 9 Months of \n Premium for ₹ 200",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'LibreFranklin',
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Cards(),
          const Buttons(text: 'GET PREMIUM'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "' Terms and conditions apply. Open only to users who aren\'t subscribed to a recurring Premium plan and who haven\'t purchased a 12-month one-time Premium plan at a promotional price. Offer ends 8/15/23.'",
            style: TextStyle(
              color: Color.fromRGBO(184, 184, 184, 10),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const CurrentPlan(),
          const PremiumPlan(),
        ],
      ),
      bottomNavigationBar: BottomBar(3),
    ));
  }
}
