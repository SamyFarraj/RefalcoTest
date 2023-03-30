
class CustomError  {
  final String errorMessage;
  final String errorCode;

  const CustomError({ this.errorMessage = '' , this.errorCode =''});


  @override
  String toString() {
    return '$errorMessage';
  }

  @override
  List<Object> get props => [errorMessage , errorCode];
}