#!/bin/bash

echo "::group::Clean previous builds"
rm -rf $XCFRAMEWORK_OUTPUT_DIR
mkdir $XCFRAMEWORK_OUTPUT_DIR
echo "::endgroup::"

echo "::group::Build for iOS"
xcodebuild archive \
  -scheme $XCFRAMEWORK_NAME \
  -destination 'generic/platform=iOS' \
  -archivePath "$XCFRAMEWORK_OUTPUT_DIR/ios" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES
echo "::endgroup::"

echo "::group::Build for iOS Simulator"
xcodebuild archive \
  -scheme $XCFRAMEWORK_NAME \
  -destination 'generic/platform=iOS Simulator' \
  -archivePath "$XCFRAMEWORK_OUTPUT_DIR/ios_simulator" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES
echo "::endgroup::"

echo "::group::Create XCFramework"
xcodebuild -create-xcframework \
  -framework "$XCFRAMEWORK_OUTPUT_DIR/ios.xcarchive/Products/Library/Frameworks/$XCFRAMEWORK_NAME.framework" \
  -framework "$XCFRAMEWORK_OUTPUT_DIR/ios_simulator.xcarchive/Products/Library/Frameworks/$XCFRAMEWORK_NAME.framework" \
  -output "$XCFRAMEWORK_OUTPUT_DIR/$XCFRAMEWORK_NAME.xcframework"
echo "::endgroup::"

echo "::group::Sign XCFramework"
codesign -s "iPhone Distribution: Blazej SLEBODA (43VBDTY4E3)" \
  --force \
  --deep \
  -- $XCFRAMEWORK_OUTPUT_DIR/$XCFRAMEWORK_NAME_WITH_EXTENSION
echo "::endgroup::"
