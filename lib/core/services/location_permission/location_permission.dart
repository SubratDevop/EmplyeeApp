// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Position> determinePosition(BuildContext context) async {
  PermissionStatus status = await Permission.location.request();
  if (status.isGranted) {
    // Permission is granted, proceed with your logic here
  } else if (status.isDenied) {
    // Permission is denied, show a dialog to ask the user to grant permission
    showPermissionDialog(context);
  } else if (status.isPermanentlyDenied) {
    // Permission is permanently denied, show a dialog to redirect the user to the app settings
    showSettingsDialog(context);
  }
  return await Geolocator.getCurrentPosition();
}

void showPermissionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Location Permission'),
        content:
            const Text('Please grant location permission to use this app.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              openAppSettings(); // Open app settings to let user enable permissions
            },
            child: const Text('Open Settings'),
          ),
        ],
      );
    },
  );

}

void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Location Permission'),
        content: const Text(
            'Location permission is permanently denied. Please enable it in the app settings.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              openAppSettings(); // Open app settings
            },
            child: const Text('Open Settings'),
          ),
        ],
      );
    },
  );
}

Future<Position> determinePosition1() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.whileInUse) {
    // Permissions are denied forever, handle appropriately.
    return Future.error('Location enable for this  time.');
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
