import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';
import '../widgets/app_large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("img/" + images[index]),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppLargeTexts(text: "Trips"),
                          const AppTexts(text: "Mountain"),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            child: AppTexts(
                                size: 14,
                                color: AppColors.textColor2,
                                text:
                                    "Mountain hikes give you an incredible sence of freedom along with endurance test"),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                BlocProvider.of<AppCubits>(context).getData(),
                            child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  const ResponsiveButton(
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(
                            3,
                            (indexDots) => Container(
                                  margin: EdgeInsets.only(top: 2),
                                  width: 8,
                                  height: index == indexDots ? 25 : 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? AppColors.mainColor
                                          : AppColors.mainColor
                                              .withOpacity(0.3)),
                                )),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
