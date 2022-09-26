.PHONY: setup

setup:
	@npm install -g firebase-tools
	-firebase login
	@firebase init
#	@fvm flutter pub global activate intl_utils
	@dart pub global activate flutterfire_cli
	@flutterfire configure \
		-i dev.plugfox.aink \
		-m dev.plugfox.aink \
		-a dev.plugfox.aink \
		-p ai-ink \
		-e plugfox@gmail.com \
		-o lib/src/common/constant/firebase_options.g.dart

# ! WARNING: DO NOT CALL THIS DIRECTLY !
keytool-genkey:
	@keytool -genkey -v -keystore android/app/aink.keystore -alias aink -keyalg RSA -keysize 2048 -validity 10000

keytool-list:
	@keytool -list -v -keystore ~/.android/debug.keystore.jks -alias androiddebugkey -storepass android -keypass android
