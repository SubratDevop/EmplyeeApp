import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'enums.dart';

class Utils {
  static String getImagePath(
      {required String name,
      required AssetFolderType type,
      required ImageFormat format}) {
    return 'assets/${type.name}/$name.${format.name}';
  }

  static List<String> removeDuplicatesIgnoreCase(List<String> list) {
    // Create a Set to store unique elements (case-insensitive)
    Set<String> uniqueElements = {};

    // Iterate through the list
    for (String element in list) {
      // Convert each element to lowercase before adding to the Set
      uniqueElements.add(element.toLowerCase());
    }

    // Convert the Set back to a List
    List<String> result = uniqueElements.toList();
    return result;
  }

  static void dismissKeyboard({required BuildContext context}) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        // FocusScope.of(context).unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
    );

    /// Ensure the keyboard is dismissed
    // FocusScopeNode currentFocus = FocusScope.of(context);
    // if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    //   currentFocus.focusedChild?.unfocus();
    // }

    // Hide the keyboard with smooth animation
    // SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

}
