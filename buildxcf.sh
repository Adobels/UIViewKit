#!/bin/bash

# Clean previous builds
rm -rf $XCFRAMEWORK_OUTPUT_DIR
mkdir $XCFRAMEWORK_OUTPUT_DIR

# Build for iOS
xcodebuild archive \
  -scheme $XCFRAMEWORK_NAME \
  -destination 'generic/platform=iOS' \
  -archivePath "$XCFRAMEWORK_OUTPUT_DIR/ios" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Build for iOS Simulator
xcodebuild archive \
  -scheme $XCFRAMEWORK_NAME \
  -destination 'generic/platform=iOS Simulator' \
  -archivePath "$XCFRAMEWORK_OUTPUT_DIR/ios_simulator" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
  -framework "$XCFRAMEWORK_OUTPUT_DIR/ios.xcarchive/Products/Library/Frameworks/$XCFRAMEWORK_NAME.framework" \
  -framework "$XCFRAMEWORK_OUTPUT_DIR/ios_simulator.xcarchive/Products/Library/Frameworks/$XCFRAMEWORK_NAME.framework" \
  -output "$XCFRAMEWORK_OUTPUT_DIR/$XCFRAMEWORK_NAME.xcframework"
