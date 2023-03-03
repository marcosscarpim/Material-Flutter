// Basic Program

// Define a function.
void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
void main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}

// Variables

var name = 'Doni';
Object name2 = 'Doni';
String name3 = 'Doni';

// Default values example

void checkDefaultValues() {
  var number = 42;
  int? nullLineCount;
  assert(nullLineCount == null);

  int lineCount = 0;
  // ignore: unnecessary_null_comparison
  assert(lineCount != null);

  int lineCount2;
  if (number == 42) {
    lineCount2 = number;
  } else {
    lineCount2 = 0;
  }

  print(lineCount2);
}

// Late init

// if temperature is never used, function is never called!
late String temperature = readTemperature();

String readTemperature() => "42 celsius";
