#!/bin/bash

# Variables
PACKAGE_NAME="UIViewKit"
OUTPUT_DIR=".xcframework"
XCFRAMEWORK_NAME="UIViewKit"

# Clean previous builds
rm -rf $OUTPUT_DIR
mkdir $OUTPUT_DIR

# Build for iOS
xcodebuild archive \
  -scheme $PACKAGE_NAME \
  -destination 'generic/platform=iOS' \
  -archivePath "$OUTPUT_DIR/ios" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Build for iOS Simulator
xcodebuild archive \
  -scheme $PACKAGE_NAME \
  -destination 'generic/platform=iOS Simulator' \
  -archivePath "$OUTPUT_DIR/ios_simulator" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
  -framework "$OUTPUT_DIR/ios.xcarchive/Products/Library/Frameworks/$PACKAGE_NAME.framework" \
  -framework "$OUTPUT_DIR/ios_simulator.xcarchive/Products/Library/Frameworks/$PACKAGE_NAME.framework" \
  -output "$OUTPUT_DIR/$XCFRAMEWORK_NAME.xcframework"

# Add SIGN CERTIFICATE TO KEYCHAIN app
echo "$CERTIFICATE_P12" > certificate.p12
security import certificate.p12 -k ~/Library/Keychains/login.keychain-db -P "$CERTIFICATE_P12_PASSWORD" -T /usr/bin/codesign -T /usr/bin/security
security find-certificate -c "iPhone Distribution: Blazej SLEBODA (43VBDTY4E3)" ~/Library/Keychains/login.keychain-db
rm certificate.p12

# Sign
codesign -s "iPhone Distribution: Blazej SLEBODA (43VBDTY4E3)" --force --deep -- $OUTPUT_DIR/$XCFRAMEWORK_NAME.xcframework
