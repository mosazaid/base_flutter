import 'package:JordanElectricPowerCompany/core/viewModel/project_view_model.dart';
import 'package:JordanElectricPowerCompany/utils/app_shared_pref.dart';
import 'package:JordanElectricPowerCompany/utils/helpers.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/common/rounded_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../config/size_config.dart';
import '../app_texts_widget.dart';
import 'drawer_item_widget.dart';

AppSharedPreferences sharedPref = new AppSharedPreferences();

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Helpers helpers = new Helpers();
  ProjectViewModel projectsProvider;

  @override
  Widget build(BuildContext context) {
    // AuthenticationViewModel authenticationViewModel = Provider.of(context);
    projectsProvider = Provider.of(context);
    return RoundedContainer(
      child: Container(
        color: Colors.white,
        child: Drawer(
            child: Column(children: <Widget>[
          /* Expanded(
            flex: 4,
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                // height: SizeConfig.heightMultiplier * 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/dr_app_logo.png',
                          ),
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            */ /*child: Icon(
                              DoctorApp.close_1,
                              size: 20,
                            ),*/ /*
                          ),
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(height: 5),
                    if (authenticationViewModel.doctorProfile != null)
                      InkWell(
                        onTap: () {
                          // TODO: return it back when its needed
                          // Navigator.of(context).pushNamed(PROFILE, arguments: {
                          //   'title': authProvider.doctorProfile.doctorName,
                          //   "doctorProfileall": authProvider.doctorProfile
                          // });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: AppText(
                                TranslationBase.of(context).dr +
                                    authenticationViewModel.doctorProfile?.doctorName,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E303A),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: AppText(
                                  authenticationViewModel.doctorProfile?.clinicDescription,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2E303A),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ))
                          ],
                        ),
                      ),
                    SizedBox(height: 40),
                    InkWell(
                      child: DrawerItem(
                        TranslationBase.of(context).applyOrRescheduleLeave,
                        icon: DoctorApp.reschedule__1,
                        // subTitle: ,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddRescheduleLeavScreen(),
                              // MyReferredPatient(),
                            ));
                      },
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      child: DrawerItem(
                        TranslationBase.of(context).myQRCode,
                        icon: DoctorApp.qr_code_3,
                        // subTitle: ,
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      child: Container(
                        height: 80,
                        child: Image.asset('assets/images/qr_code.png'),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    InkWell(
                      child: DrawerItem(
                        projectsProvider.isArabic
                            ? TranslationBase.of(context).lanEnglish
                            : TranslationBase.of(context).lanArabic,
                        // icon: DoctorApp.qr_code,
                        assetLink: projectsProvider.isArabic
                            ? 'assets/images/usa-flag.png'
                            : 'assets/images/saudi-arabia-flag.png',
                      ),
                      onTap: () {
                        if (projectsProvider.isArabic)
                          projectsProvider.changeLanguage('en');
                        else
                          projectsProvider.changeLanguage('ar');
                      },
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      child: DrawerItem(
                        TranslationBase.of(context).logout,
                        icon: DoctorApp.logout_1,
                      ),
                      onTap: () async {
                        Navigator.pop(context);
                        await authenticationViewModel.logout(isFromLogin: false);

                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
              flex: 1,
              child: Column(children: <Widget>[
                Container(
                    // This align moves the children to the bottom
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Powered by',
                                    style: TextStyle(
                                      color: Color(0xFF989898),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Cloud Solutions',
                                        style: TextStyle(
                                          color: Color(0xFF2E303A),
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            // Text("Powered by"),
                            Image.asset(
                              'assets/images/cs_logo_container.png',
                              width: SizeConfig.imageSizeMultiplier * 20,
                            )
                          ],
                        ))))
              ]))*/
        ])),
      ),
      width: SizeConfig.realScreenWidth * 0.60,
      margin: EdgeInsets.all(0),

      customCornerRaduis: false,
      // topRight: 30,
      // bottomRight: 30,
      backgroundColor: Colors.white,
    );
  }

  drawerNavigator(context, routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}
