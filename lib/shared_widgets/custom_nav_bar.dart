import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constants/paths/icon_paths.dart';
import '../providers/navigation_provider.dart';



class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(30)),
        color: Colors.white,
      ),
      child:
          Consumer<NavigationProvider>(builder: (context, navService, child) {
        int selectedTab = navService.selectedHomeScreenTab;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      (selectedTab == 0)
                          ? IconPaths.HOME_FILLED_ICON
                          : IconPaths.HOME_ICON,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context
                              .read<NavigationProvider>()
                              .setSelectedHomeScreenTab(0);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      (selectedTab == 1)
                          ? IconPaths.PROFILE_FILLED_ICON
                          : IconPaths.PROFILE_ICON,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context
                              .read<NavigationProvider>()
                              .setSelectedHomeScreenTab(1);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      (selectedTab == 2)
                          ? IconPaths.CART_FILLED_ICON
                          : IconPaths.CART_ICON,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {


                          context
                              .read<NavigationProvider>()
                              .setSelectedHomeScreenTab(2);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        );
      }),
    );
  }
}
