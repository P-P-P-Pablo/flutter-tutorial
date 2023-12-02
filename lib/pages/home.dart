import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutorial/models/category_model.dart';
import 'package:tutorial/models/diet_model.dart';
import 'package:tutorial/models/popular_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void getCategories() {
    categories = CategoryModel.getCategories();
  }

  void getDiets() {
    diets = DietModel.getDiets();
  }

  void getPopular() {
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  void getInitialInfo() {
    getCategories();
    getDiets();
    getPopular();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          searchField(),
          const SizedBox(
            height: 40,
          ),
          categoriesSection(),
          const SizedBox(
            height: 40,
          ),
          dietsSection(),
          const SizedBox(
            height: 40,
          ),
          popularDietsSection()
        ],
      ),
    );
  }

  Column popularDietsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Popular",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 115,
              decoration: BoxDecoration(
                color: popularDiets[index].boxIsSelected
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: popularDiets[index].boxIsSelected
                    ? [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0,
                        )
                      ]
                    : [],
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  const Placeholder(
                    fallbackWidth: 80,
                    fallbackHeight: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Text(
                          popularDiets[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                          style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Placeholder(
                      fallbackWidth: 30,
                      fallbackHeight: 30,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(
            height: 15,
          ),
          itemCount: popularDiets.length,
        )
      ],
    );
  }

  Column dietsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Recommendation for diets",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index]
                      .boxColor
                      .withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      const Placeholder(
                        fallbackHeight: 80,
                      ),
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(
                            '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                            style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight:
                                    FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [
                          diets[index].viewIsSelected
                              ? const Color(0xff9DCEFF)
                              : Colors.transparent,
                          diets[index].viewIsSelected
                              ? const Color(0xff92A3FD)
                              : Colors.transparent
                        ])),
                        child: Center(
                            child: Text(
                          "View",
                          style: TextStyle(
                              color: diets[index]
                                      .viewIsSelected
                                  ? Colors.white
                                  : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        )),
                      )
                    ]),
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(
              width: 25,
            ),
            itemCount: diets.length,
          ),
        ),
      ],
    );
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  const SizedBox(
                    width: 20,
                  ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index]
                          .boxColor
                          .withOpacity(0.3),
                      borderRadius:
                          BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: const Placeholder(),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Pancakes",
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black38,
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child:
                SvgPicture.asset("assets/icons/Search.svg"),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                        "assets/icons/Filter.svg"),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "BreakFast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
              "assets/icons/Arrow - Left 2.svg"),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                SvgPicture.asset("assets/icons/dots.svg"),
          ),
        )
      ],
    );
  }
}
