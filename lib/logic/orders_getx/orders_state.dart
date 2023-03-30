abstract class OrdersState{}

class InitialOrdersState extends OrdersState {}
class LoadedOrdersState extends OrdersState {}
class LoadingOrdersState extends OrdersState {}
class ErrorOrdersState extends OrdersState {
  late String messageError;
  late String statusErrorNumber;

  ErrorOrdersState({ this.messageError='',this.statusErrorNumber=''});
}