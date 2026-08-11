#!/bin/bash

set -e

FRAMEWORK_NAME="SharedSDK"
SCHEME_NAME="SharedSDK"
CONFIGURATION="Release"
BUILD_DIR="./build"
XCFRAMEWORK_OUTPUT="./${FRAMEWORK_NAME}.xcframework"

# Clean previous builds
rm -rf "${BUILD_DIR}"

# Build for iOS Device
xcodebuild archive \
  -scheme "${SCHEME_NAME}" \
  -destination "generic/platform=iOS" \
  -archivePath "${BUILD_DIR}/${FRAMEWORK_NAME}-iOS" \
  -sdk iphoneos \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Delete previous XCFramework
rm -rf "${XCFRAMEWORK_OUTPUT}"

# Create XCFramework
xcodebuild -create-xcframework \
  -framework "${BUILD_DIR}/${FRAMEWORK_NAME}-iOS.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
  -output "${XCFRAMEWORK_OUTPUT}"

echo "✅ XCFramework created at ${XCFRAMEWORK_OUTPUT}"

