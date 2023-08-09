import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int currentIndex = 4;

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (_, state) {
      DetailState detail = state as DetailState;

      return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(children: [
          Positioned(
              child: Container(
            width: double.maxFinite,
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "http://mark.bslmeiyu.com/uploads/" + detail.place.img),
                    fit: BoxFit.cover)),
          )),
          Positioned(
              left: 20,
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                ],
              )),
          Positioned(
              top: 230,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 550,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeTexts(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppTexts(
                              text: "\$" + detail.place.price.toString(),
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: AppColors.mainColor,
                            ),
                            AppTexts(
                              text: detail.place.location,
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: index < detail.place.stars
                                              ? AppColors.starColor
                                              : Colors.grey,
                                        ))),
                            SizedBox(
                              width: 10,
                            ),
                            AppTexts(
                              text: "(5.0)",
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AppLargeTexts(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppTexts(text: "Number of people are in your group"),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => InkWell(
                                      onTap: () => setState(() {
                                        selectedIndex = index;
                                      }),
                                      child: AppButton(
                                        text: (index + 1).toString(),
                                        isIcon: false,
                                        backgroundColor: selectedIndex == index
                                            ? Colors.black
                                            : AppColors.buttonBackground,
                                        borderColor: selectedIndex == index
                                            ? Colors.black
                                            : AppColors.buttonBackground,
                                        size: 60,
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ))),
                        SizedBox(
                          height: 10,
                        ),
                        AppLargeTexts(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppTexts(text: detail.place.description),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveButton(
                  width: 200,
                  isResponsive: true,
                ),
                SizedBox(
                  width: 150,
                ),
                AppButton(
                  icon: Icons.heat_pump_sharp,
                  backgroundColor: Colors.grey[200]!,
                  borderColor: AppColors.mainColor,
                  size: 60,
                  color: AppColors.mainTextColor,
                  isIcon: true,
                ),
              ],
            ),
          )
        ]),
      );
    }));
  }
}
