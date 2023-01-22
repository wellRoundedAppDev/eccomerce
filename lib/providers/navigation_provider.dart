import 'package:flutter/cupertino.dart';

class NavigationProvider extends ChangeNotifier{

  int selectedHomeScreenTab = 0;

  setSelectedHomeScreenTab(int selectedTabIndex) async {
    selectedHomeScreenTab = selectedTabIndex;

    notifyListeners();
  }

}