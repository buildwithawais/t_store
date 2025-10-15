class Debug {
  static void printBlue(String message) {
    print('\x1B[34m$message\x1B[0m'); // 🔵 Blue
  }

  static void printGreen(String message) {
    print('\x1B[32m$message\x1B[0m'); // 🟢 Green
  }

  static void printYellow(String message) {
    print('\x1B[33m$message\x1B[0m'); // 🟡 Yellow
  }

  static void printRed(String message) {
    print('\x1B[31m$message\x1B[0m'); // 🔴 Red
  }
}
