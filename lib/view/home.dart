import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taibaa_iinterview/constants/styles.dart';
import 'package:taibaa_iinterview/controller/home_controller.dart';

import '../constants/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.red,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          padding: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/svg/Home.svg'),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/svg/Tickets.svg'),
                    label: 'My tickets',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/svg/Notice.svg'),
                    label: 'Notice',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/svg/Account.svg'),
                    label: 'Account',
                  ),
                ]),
          ),
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
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Obx(() {
                      final titleModel =
                          Get.find<HomeController>().titleModel.value;
                      if (titleModel.status == null) {
                        return SizedBox(
                          height: 50.0,
                          child: Shimmer.fromColors(
                            baseColor: Colors.red.shade600,
                            highlightColor: Colors.red.shade400,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        );
                      } else if (titleModel.status == 200) {
                        return Text(
                          '${titleModel.data?.eTitle[0] ?? ''}\n${titleModel.data?.eTitle[1] ?? ''}',
                          style: kTitleTextStyle,
                        );
                      } else {
                        return const Text(
                          'Something went wrong!!',
                          style: kTitleTextStyle,
                        );
                      }
                    }),
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
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    final sliderModel =
                        Get.find<HomeController>().sliderModel.value;
                    if (sliderModel.status == null) {
                      return SizedBox(
                        height: 200.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      );
                    } else if (sliderModel.status == 200) {
                      return FlutterCarousel(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          height: 200.0,
                          indicatorMargin: 2,
                          showIndicator: true,
                          slideIndicator: const CircularSlideIndicator(
                              currentIndicatorColor: Colors.red,
                              indicatorRadius: 3,
                              indicatorBackgroundColor: Colors.grey),
                        ),
                        items: List.generate(
                            sliderModel.data?.length ?? 0,
                            (index) => SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        sliderModel.data?[index].eImage ?? '',
                                        fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          return loadingProgress == null
                                              ? child
                                              : SizedBox(
                                                  height: 200.0,
                                                  child: Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey.shade300,
                                                    highlightColor:
                                                        Colors.grey.shade100,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                  ),
                                                );
                                        },
                                      ),
                                    ),
                                  ),
                                )),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        height: 200,
                        child: const Icon(
                          Icons.error_outline,
                          size: 80,
                          color: Colors.red,
                        ),
                      );
                    }
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
                  Obx(() {
                    final categoriesModel =
                        Get.find<HomeController>().categoriesModel.value;
                    if (categoriesModel.status == null) {
                      return SizedBox(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: GridView.count(
                            childAspectRatio: 1.4,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            children: [1, 2, 3, 4]
                                .map(
                                  (e) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    } else if (categoriesModel.status == 200) {
                      return GridView.count(
                        childAspectRatio: 1.4,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        children: categoriesModel.data!
                            .map((e) => Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: Image.network(
                                          e.image,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            return loadingProgress == null
                                                ? child
                                                : Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey.shade300,
                                                    highlightColor:
                                                        Colors.grey.shade100,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  );
                                          },
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        e.eName,
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
                      );
                    } else {
                      return GridView.count(
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: [1, 2, 3, 4]
                            .map(
                              (e) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Customer Testimonials',
                    style: TextStyle(
                        height: 1.8, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    final testimonialsModel =
                        Get.find<HomeController>().testimonialsModel.value;
                    if (testimonialsModel.status == null) {
                      return SizedBox(
                        height: 100,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    } else if (testimonialsModel.status == 200) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: testimonialsModel.data?.length ?? 0,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100,
                          ),
                          child: ListTile(
                            title: Text(
                              testimonialsModel.data?[index].eName ?? '',
                              style: const TextStyle(
                                  height: 2.5, color: Colors.grey),
                            ),
                            subtitle: Text(
                              testimonialsModel.data?[index].eComment ?? '',
                              style: const TextStyle(
                                  height: 2.5, color: Colors.grey),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Something went wrong!!'),
                      );
                    }
                  }),
                  FlutterCarousel(
                    options: CarouselOptions(
                      viewportFraction: 0.25,
                      initialPage: 1,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      height: 150.0,
                      indicatorMargin: 2,
                      showIndicator: true,
                      slideIndicator: const CircularSlideIndicator(
                          currentIndicatorColor: Colors.red,
                          indicatorRadius: 3,
                          indicatorBackgroundColor: Colors.grey),
                    ),
                    items: kCarouselImageList
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: e == kCarouselImageList[1] ? 0 : 30),
                              child: Image.asset(
                                e,
                                scale: 0.5,
                              ),
                            ))
                        .toList(),
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
