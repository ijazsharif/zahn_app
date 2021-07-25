import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zahn_app/core/helpers/database_helper.dart';
import 'package:zahn_app/core/util/connectivity_ckecker.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(Cheking());

  DataBaseHelper _dataBaseHelper = DataBaseHelper();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is RunStartupChecker) {
      await Future.delayed(Duration(seconds: 2));
      int appRuns = await DataBaseHelper().getNumberOfAppRuns();
      if (appRuns == 1) {
        yield AppRunForTheFirstTime();
        _dataBaseHelper.incrementNumberOfAppRuns(currentNumberOfRuns: appRuns);
      } else {
        DataBaseHelper().incrementNumberOfAppRuns(currentNumberOfRuns: appRuns);
        bool isAppConnected = await connectivityStatusChecker();
        if (isAppConnected) {
          yield AppIsConnected();
        } else {
          yield AppIsNotConnected();
        }
      }
    }
    if (event is CheckAppConnectivity) {
      yield Cheking();
      bool isAppConnected = await connectivityStatusChecker();
      if (isAppConnected) {
        yield AppIsConnected();
      } else {
        yield AppIsNotConnected();
      }
    }
  }
}
