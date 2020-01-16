// Developed by Bilal Shahid
// For queries, contact: bilalscheema@gmail.com

import 'package:flutter/material.dart';
import 'persistent-tab-view.dart';

class PersistentTabView extends StatelessWidget {
  PersistentTabView(
      {Key key,
      @required this.items,
      @required this.screens,
      this.controller,
      this.showElevation = false,
      this.backgroundColor = CupertinoColors.white,
      this.iconSize = 26.0,
      this.selectedIndex = 0,
      this.onItemSelected,
      this.isCurved = false,
      this.bottomPadding,
      this.horizontalPadding,
      this.navBarStyle = NavBarStyle.style1})
      : super(key: key) {
    assert(items != null);
    assert(screens != null);
    assert(items.length >= 2 && items.length <= 5);
  }

  ///List of persistent bottom navigation bar items to be displayed in the navigation bar.
  final List<PersistentBottomNavBarItem> items;

  ///Screens that will be displayed on tapping of persistent bottom navigation bar items.
  final List<Widget> screens;

  ///Controller for persistent bottom navigation bar. Will be declared if left empty.
  final PersistentTabController controller;

  ///Background color of bottom navigation bar. `white` by default.
  final Color backgroundColor;

  ///Show shadow on the upper part of the navigation bar to give it an elevated feel. `true` by default.
  final bool showElevation;

  ///Icon size for the `persistent bottom navigation bar items`. `26.0` by default.
  final double iconSize;

  ///Index of the page to be selected. `0` by default.
  final int selectedIndex;

  ///Callback when page or tab change is detected.
  final ValueChanged<int> onItemSelected;

  ///Curves the top corners of the persistent bottom navigation bar. `false` by default.
  final bool isCurved;

  ///Style for persistent bottom navigation bar. Accepts `NavBarStyle` to determine the theme.
  final String navBarStyle;

  ///Bottom `padding` for the persistent navigation bar items. \n\n`USE WITH CAUTION, CAN BREAK THE NAV BAR`.
  final double bottomPadding;

  ///Horizontal `padding` for the persistent navigation bar items. \n\n`USE WITH CAUTION, CAN BREAK THE NAV BAR`.
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return PersistentTabScaffold(
      controller: this.controller,
      isIOS: isIOS(context),
      tabBar: PersistentBottomNavBar(
        showElevation: this.showElevation,
        items: this.items,
        backgroundColor: this.backgroundColor,
        iconSize: this.iconSize,
        navBarHeight: isIOS(context) ? 90.0 : 60.0,
        selectedIndex: this.selectedIndex,
        isIOS: isIOS(context),
        isCurved: isCurved,
        bottomPadding: this.bottomPadding,
        horizontalPadding: this.horizontalPadding,
        navBarStyle: this.navBarStyle,
        onItemSelected: (int index) {
          this.onItemSelected(index);
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          return screens[index];
        });
      },
    );
  }
}
