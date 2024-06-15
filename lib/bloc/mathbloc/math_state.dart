import 'package:equatable/equatable.dart';
import 'package:final_project/models/response_model.dart';

abstract class MathSolverState extends Equatable {
  @override
  List get props => [];
}

class MathSolverInitial extends MathSolverState {}

class MathSolverLoading extends MathSolverState {}

class MathSolverSuccess extends MathSolverState {
  final ResponseModel response;

  MathSolverSuccess(this.response);

  @override
  List get props => [response];
}

class MathSolverFailure extends MathSolverState {
  final String error;

  MathSolverFailure(this.error);

  @override
  List get props => [error];
}