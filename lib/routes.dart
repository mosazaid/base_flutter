
import 'package:JordanElectricPowerCompany/root_page.dart';
import 'package:JordanElectricPowerCompany/screens/authentication/LoginScreen.dart';

import 'landing_page.dart';

const String INIT_ROUTE = ROOT;
const String ROOT = 'root';
const String HOME = '/';
const String LOGIN = 'login';

// const String PATIENT_MEDICAL_REPORT_DETAIL = 'patients/medical-report-detail';
// const String PATIENT_UCAF_REQUEST = 'patients/ucaf';
// const String PATIENT_UCAF_DETAIL = 'patients/ucaf/detail';

var routes = {
  ROOT: (_) => RootPage(),
  HOME: (_) => LandingPage(),
  LOGIN: (_) => LoginScreen(),

  // PATIENT_UCAF_REQUEST: (_) => UCAFInputScreen(),
  // PATIENT_UCAF_DETAIL: (_) => UcafDetailScreen(),
  // PATIENT_ECG: (_) => ECGPage(),
};
