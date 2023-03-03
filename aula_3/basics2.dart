// const and final

const name = "Doni";
var foo = const [];
final bar = const [];
const baz = [];

void modifyFoo() {
  foo = [1, 2, 3];
  foo = const [1, 2, 3];
}

// Functions

var _nobleGases = [];

bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;

bool isNoble2(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

isNoble3(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// Parameters

void enableNamedFlags({bool bold = false, bool? hidden}) {/*...*/}
void enableRequiredFlags({required bool bold, bool? hidden}) {/*...*/}

void useEnableFlags() {
  enableNamedFlags(bold: true, hidden: null);
  enableNamedFlags();
  // it doesn't work!
  //enableRequiredFlags();
  enableRequiredFlags(bold: true);
}

// Optional parameters

String say(String from, String msg, [String? device]) {
  var result = '$from fala para $msg';
  if (device != null) {
    result = '$result com $device';
  }
  return result;
}

void checkOptional() {
  assert(say('Doni', 'Joao') == 'Doni fala para Joao');

  assert(say('Doni', 'Joao', 'celular') == 'Doni fala para Joao com celular');
}

// Classes and Constructors

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }

  Point.origin()
      : x = xOrigin,
        y = yOrigin;
}

class PointShortten {
  double x = 0;
  double y = 0;

  PointShortten(this.x, this.y);
}

class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson().
  Employee.fromJson(super.data) : super.fromJson() {
    print('in Employee');
  }
}

void useEmployee() {
  var employee = Employee.fromJson({});
  print(employee);
  // Prints:
  // in Person
  // in Employee
  // Instance of 'Employee'
}

// Extension Function

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

void useExtension() {
  int myInt = "42".parseInt();
}

// Implicity interfaces

abstract class IsSilly {
  void makePeopleLaugh();
}

class Clown implements IsSilly {
  @override
  void makePeopleLaugh() {
    print("Aperte o nariz de palhaço!");
  }
}

class Comedian implements IsSilly {
  // Anotação de override é opcional.
  void makePeopleLaugh() {
    print("Conte uma piada!");
  }
}

void main() {
  IsSilly clown = Clown();
  IsSilly comedian = Comedian();

  clown.makePeopleLaugh();
  comedian.makePeopleLaugh();
}
