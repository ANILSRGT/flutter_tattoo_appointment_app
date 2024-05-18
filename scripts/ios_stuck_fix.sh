#!/bin/bash

cd ..
rm -R build
rm .dart_tool
rm .packages
rm -Rf ios/Pods
rm -Rf ios/.symlinks
rm -Rf ios/Flutter/Flutter.framework
rm -Rf ios/Flutter/Flutter.podspec
pod cache clean --all
cd ios
pod deintegrate
pod setup
arch -x86_64 pod install
cd ..
flutter clean -v
flutter pub get
