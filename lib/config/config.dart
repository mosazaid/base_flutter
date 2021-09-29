import 'package:flutter/material.dart';

const MAX_SMALL_SCREEN = 660;
const ONLY_NUMBERS = "[0-9]";
const ONLY_LETTERS = "[a-zA-Z &'\"]";
const ONLY_DATE = "[0-9/]";
const BASE_URL_LIVE_CARE = 'https://livecare.hmg.com/';
const BASE_URL = 'https://hmgwebservices.com/';
// const BASE_URL = 'https://uat.hmgwebservices.com/';

const GET_TEMPLETE_LIST = 'Services/Doctors.svc/REST/DAPP_TemplateGet';

const GET_PROCEDURE_TEMPLETE_DETAILS = "Services/Doctors.svc/REST/DAPP_ProcedureTemplateDetailsGet";
const GET_PENDING_PATIENT_ER_FOR_DOCTOR_APP = 'Services/DoctorApplication.svc/REST/GetPendingPatientERForDoctorApp';

const DOCTOR_CHECK_HAS_LIVE_CARE = "Services/DoctorApplication.svc/REST/CheckDoctorHasLiveCare";

const LIVE_CARE_IS_LOGIN = "LiveCareApi/DoctorApp/UseIsLogin";
const ADD_REFERRED_REMARKS_NEW = "Services/DoctorApplication.svc/REST/AddReferredDoctorRemarks_New";
const GET_SPECIAL_CLINICAL_CARE_LIST = "Services/DoctorApplication.svc/REST/GetSpecialClinicalCareList";
const GET_SPECIAL_CLINICAL_CARE_MAPPING_LIST = "Services/DoctorApplication.svc/REST/GetSpecialClinicalCareMappingList";


var DEVICE_TOKEN = "";
const PRIMARY_COLOR = 0xff515B5D;

const TRANSACTION_NO = 0;
const LANGUAGE_ID = 2;
const STAMP = '2020-04-27T12:17:17.721Z';
const IP_ADDRESS = '9.9.9.9';
const VERSION_ID = 6.1;
const CHANNEL = 9;
const SESSION_ID = 'BlUSkYymTt';
const IS_LOGIN_FOR_DOCTOR_APP = true;
const PATIENT_OUT_SA = false;
const IS_DENTAL_ALLOWED_BACKEND = false;
const PATIENT_OUT_SA_PATIENT_REQ = 0;
const SETUP_ID = '91877';
const GENERAL_ID = 'Cs2020@2016\$2958';
const PATIENT_TYPE = 1;
const PATIENT_TYPE_ID = 1;

/// Timer Info
const TIMER_MIN = 10;

class AppGlobal {
  static var CONTEX;
  static Color appPrimaryColor = Color(0xFF007fc3);
  static Color greyBackgroundColor = Color(0xFFF8F8F8);
  static Color textColor = Color(0xFF575757);
  // https://stackoverflow.com/a/60455958/6246772   How to shift focus to next textfield
}
