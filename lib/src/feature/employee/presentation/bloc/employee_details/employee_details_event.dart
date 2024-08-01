part of 'employee_details_bloc.dart';

sealed class EmployeeDetailsEvent extends Equatable {
  const EmployeeDetailsEvent();
}

class GetEmployeeDetailsEvent extends EmployeeDetailsEvent {
  final String id;

  const GetEmployeeDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}
