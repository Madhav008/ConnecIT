import 'package:flutter/cupertino.dart';
import 'package:loginDesign/dynamicLinks/dynamiclink.dart';

class HomeViewModel extends ChangeNotifier {

  
  HomeViewModel() {
    DynamicLinksApi().handleDynamicLink();
  }
}
