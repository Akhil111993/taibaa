import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:http/http.dart';
import 'package:taibaa_iinterview/slider_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          padding: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'My tickets',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Notice'),
              ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    'Welcome to\nTaibaa for Hajj & Umrah',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                        fontSize: 18),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                children: [
                  FutureBuilder(
                      future: post(
                          Uri.parse(
                              'https://technologyl3.sg-host.com/api/v1/getSliders'),
                          headers: {
                            'Content-Type': 'application/json',
                            'Authorization':
                                'Basic VEdVMTIzNDVOVEFJQkFBSktLTHdlcnR5QCMlXiZARFZAVEw6UVdFUnF3ZXJ0eXVpb3BUWVVJVEFJQkFBenhjdmJubU9QMTIzNDU2IUAjJV4mKigpXyt7fSI6Pjw/fH43ODk4MGFzZGZnaGprbEFUQUlCQUFTREZHSEpLTFpYQ1ZCTk0='
                          }),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const SizedBox();
                        SliderModel? sliderModel;
                        try {
                          sliderModel =
                              sliderModelFromJson(snapshot.data!.body);
                        } on Exception {
                          return const SizedBox();
                        }
                        return FlutterCarousel(
                          options: CarouselOptions(
                            indicatorMargin: 0,
                            viewportFraction: 1,
                            height: 200.0,
                            showIndicator: true,
                            slideIndicator: const CircularSlideIndicator(
                                currentIndicatorColor: Colors.red,
                                indicatorRadius: 3,
                                indicatorBackgroundColor: Colors.grey),
                          ),
                          items: List.generate(
                              sliderModel.data.length,
                              (index) => SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          sliderModel?.data[index].eImage ?? '',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  )),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'We are offering',
                    style: TextStyle(
                        height: 1.8, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    childAspectRatio: 1.4,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      ['Umrah', 'assets/images/umrah.png'],
                      ['Hajj', 'assets/images/hajj.png'],
                      ['International Transportation', 'assets/images/bus.png'],
                      ['Apply for Visa', 'assets/images/passport.png'],
                    ]
                        .map((e) => Stack(
                              children: [
                                Image.asset(
                                  e[1],
                                ),
                                Center(
                                  child: Text(
                                    e[0],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        height: 1.4,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  const Text(
                    'Customer Testimonials',
                    style: TextStyle(
                        height: 1.8, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 2.5, color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
