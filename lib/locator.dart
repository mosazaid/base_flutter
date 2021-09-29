import 'package:get_it/get_it.dart';

import 'core/service/AuthenticationService.dart';
import 'core/service/NavigationService.dart';
import 'core/viewModel/AuthenticationViewModel.dart';

GetIt locator = GetIt.instance;

///di
void setupLocator() {
  /// Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());

  /// View Model
  locator.registerFactory(() => AuthenticationViewModel());
}
