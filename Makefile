bootstrap:
	@carthage bootstrap --platform iOS

update:
	@carthage update --platform iOS

units tests:
	@xcodebuild -project StoryboardStaticTVCTesting.xcodeproj -scheme "StoryboardStaticTVCTesting" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=11.1,name=iPhone 8" build test
