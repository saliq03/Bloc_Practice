
import 'package:equatable/equatable.dart';

class Ttry extends Equatable{
const Ttry({required this.name,required this.age});
  final String name;
  final int  age;

  @override

  List<Object?> get props => [name,age];







   // WITHOUT USIGNG EQUITABLE PACKAGE

  // @override
  // int get hashCode => name.hashCode ^age.hashCode;
  //
  // @override
  // bool operator ==(Object other) {
  //   return identical(this, other) ||
  //     other is ttry &&
  //   runtimeType==other.runtimeType &&
  //   name==other.name &&
  //   age == other.age;
  //
  // }

}

