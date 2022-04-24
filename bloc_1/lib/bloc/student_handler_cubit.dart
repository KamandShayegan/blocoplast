import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'student_handler_state.dart';

class StudentHandlerCubit extends Cubit<StudentHandlerState> {
  ///initial value is set here:
  StudentHandlerCubit() : super(StudentHandlerState(badSts: []));

  addToBadSts(String name) {
    state.badSts.add(name);
    return emit(StudentHandlerState(badSts: state.badSts));
  }

  void removeFromBadSts(String name){
    state.badSts.removeWhere((element) => element==name);
    return emit(StudentHandlerState(badSts: state.badSts));
  }

}
