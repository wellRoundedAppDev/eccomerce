import 'package:flutter/cupertino.dart';

class NavigationProvider extends ChangeNotifier{

  int selectedHomeScreenTab = 2;

  setSelectedHomeScreenTab(int selectedTabIndex) async {
    selectedHomeScreenTab = selectedTabIndex;

    notifyListeners();
  }

}