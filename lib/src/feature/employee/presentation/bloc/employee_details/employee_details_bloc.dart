import 'package:bloc/bloc.dart';
import 'package:cosmocloud_task/src/feature/employee/data/repository/repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../../app/error/error.dart';
import '../../../model/employee_model.dart';

part 'employee_details_event.dart';
part 'employee_details_state.dart';

class EmployeeDetailsBloc
    extends Bloc<EmployeeDetailsEvent, EmployeeDetailsState> {
  final EmployeeRepository _employeeRepository;

  EmployeeDetailsBloc(EmployeeRepository employeeRepository)
      : _employeeRepository = employeeRepository,
        super(const EmployeeDetailsState()) {
    on<GetEmployeeDetailsEvent>((event, emit) async {
      emit(const EmployeeDetailsLoadingState());

      final employeeResponse =
          await _employeeRepository.getEmployeeById(event.id);

      employeeResponse.fold(
        (employee) => emit(EmployeeDetails(employee)),
        (failure) => emit(EmployeeDetailsErrorState(failure)),
      );
    });
  }
}
