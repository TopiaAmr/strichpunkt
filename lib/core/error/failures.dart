import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// Define your specific failures here
class ServerFailure extends Failure {}
class CacheFailure extends Failure {}
