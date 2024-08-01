part of 'employee_details_bloc.dart';

final class EmployeeDetailsState extends Equatable {
  const EmployeeDetailsState();

  @override
  List<Object?> get props => [];
}

final class EmployeeDetails extends EmployeeDetailsState {
  final Employee employee;

  const EmployeeDetails(this.employee);

  @override
  List<Object> get props => [employee];
}

final class EmployeeDetailsLoadingState extends EmployeeDetailsState {
  const EmployeeDetailsLoadingState();

  @override
  List<Object> get props => [];
}

final class EmployeeDetailsErrorState extends EmployeeDetailsState {
  final Failure failure;

  const EmployeeDetailsErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
