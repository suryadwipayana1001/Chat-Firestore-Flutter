import 'dart:io';

void printSuccess(dynamic text) {
  if (Platform.isIOS) {
    stdout.write('\x1B[32m$text\x1B[0m\n');
  } else {
    print('\x1B[32m$text\x1B[0m');
  }
}

void printWarning(dynamic text) {
  if (Platform.isIOS) {
    stdout.write('\x1B[33m$text\x1B[0m\n');
  } else {
    print('\x1B[33m$text\x1B[0m');
  }
}

void printError(dynamic text) {
  if (Platform.isIOS) {
    stdout.write('\x1B[31m$text\x1B[0m\n');
  } else {
    print('\x1B[31m$text\x1B[0m');
  }
}
