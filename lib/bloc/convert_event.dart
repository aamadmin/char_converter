part of 'convert_bloc.dart';

abstract class ConvertEvent extends Equatable {
  List<Object> get props => null;
  const ConvertEvent();
}

class ConvertToUpper extends ConvertEvent {
  final String textString;
  ConvertToUpper({this.textString});
  @override
  List<Object> get props => [textString];
}

class ConvertToLower extends ConvertEvent {
  final String textString;
  ConvertToLower({this.textString});
  @override
  List<Object> get props => [textString];
}
