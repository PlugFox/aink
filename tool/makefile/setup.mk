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