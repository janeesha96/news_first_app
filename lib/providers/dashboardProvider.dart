


import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
    int? _currentTab;

  int get currentTab => _currentTab ?? 0;

  set currentTab(int data) {
    _currentTab = data;
    notifyListeners();
  }

  int? _reportsCurrentTab;

  int get reportsCurrentTab => _reportsCurrentTab ?? 0;

  set reportsCurrentTab(int data) {
    _reportsCurrentTab = data;
    notifyListeners();
  }

  int? _complaintsListCurrentTab;

  int get complaintsListCurrentTab => _complaintsListCurrentTab ??0 ;

  set complaintsListCurrentTab(int data) {
    _complaintsListCurrentTab = data;
    notifyListeners();
  }

  bool _isSearchModeOn = true;
  String _searchString = '';

  bool get isSearchModeOn => _isSearchModeOn;
  String get searchString => _searchString;

void toggleAppbarSearchMode(bool val) {
    _isSearchModeOn = val;
    notifyListeners();
  }

void setSearchString(String val) {
    _searchString = val;
    notifyListeners();
  }

   int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  setTabIndex(int tabIndex) {
    _tabIndex = tabIndex;
    notifyListeners();
  }


 





  




 
  



  


 




}