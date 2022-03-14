import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaat/authentication/shared/bloc/bloc_state.dart';

class NotsCubit extends Cubit<NotsState> {
  //Initi cubit with state
  NotsCubit() : super(InitiState());
//create object of cubit
  static NotsCubit get(context) => BlocProvider.of(context);
//start code [Funtcions and Lists and DataType

  List<String> items = [
    'item 1',
    'item 2',
    'item 3',
  ];
  var selecteditem = "item 1";

  void chooseitem(var itemsl) {
    selecteditem = itemsl;

    emit(ChooseItemsState());
  }
}
