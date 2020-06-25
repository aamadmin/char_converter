import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'convert_event.dart';

class ConvertBloc extends Bloc<ConvertEvent, String> {
  @override
  String get initialState => 'UPPER';

  @override
  Stream<String> mapEventToState(
    ConvertEvent event,
  ) async* {
    if (event is ConvertToUpper) {
      yield event.textString.toUpperCase();
    } else if (event is ConvertToLower) {
      yield event.textString.toLowerCase();
    }
  }
}
