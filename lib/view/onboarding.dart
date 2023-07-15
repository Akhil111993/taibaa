import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import 'home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 230.0,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(
                        currentIndicatorColor: Colors.red,
                        indicatorRadius: 3,
                        indicatorBackgroundColor: Colors.grey),
                  ),
                  items: List.generate(
                      4,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Image.asset('assets/images/logo.png'),
                          )),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Welcome to\nTaibaa for Hajj & Umrah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, height: 1.8, fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Home()));
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Skip for now',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
