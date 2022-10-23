import 'package:flutter/foundation.dart';

const String kFlavor = String.fromEnvironment('FLAVOR', defaultValue: kDebugMode ? 'develop' : 'production');

const String kEndpoint = String.fromEnvironment('ENDPOINT');

const String kTitle = String.fromEnvironment('TITLE', defaultValue: 'NeuroStocker');
