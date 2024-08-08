import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_prj/Home/editprofile.dart';
import 'package:test_prj/authPages/language_page.dart';
import 'package:test_prj/components/widgets/globle_widgets.dart';
import 'package:test_prj/controller/profile_controller.dart';
import 'package:test_prj/profile/ContactUs.dart';
import 'package:test_prj/profile/My_Address.dart';
import 'package:test_prj/profile/change_password.dart';
import 'package:test_prj/profile/myfuels_card.dart';
import 'package:test_prj/profile/notification1.dart';
import 'package:test_prj/profile/log_out.dart';
import 'package:test_prj/profile/profile_assets.dart';
import 'package:test_prj/splashScreen.dart';
import 'package:test_prj/staticpage/about_us.dart';
import 'package:test_prj/staticpage/privacy_policy.dart';
import 'package:test_prj/staticpage/terms_condition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Container(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(211, 83, 7, 1),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),

                      // Top App bar
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/mingcute_location-fill.png",
                                // scale: 20,
                                height: 24,
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${address.toString().split(",")[0]}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${address.toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 25,
                              ),
                              // Image.asset(
                              //   "assets/Group 2979.png",
                              //   height: 24,
                              // ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Notification1(),
                                    )),
                                child: Image.asset(
                                  "assets/Notification.png",
                                  height: 24,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.746,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),

                                  // profile card
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => controller.isLoading.value ==
                                                true
                                            ? SizedBox(
                                                width: 200.0,
                                                height: 30.0,
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.white,
                                                  highlightColor: Colors.white,
                                                  child: Text(
                                                    '     ',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : controller.userInfoModel !=
                                                        null &&
                                                    controller.userInfoModel
                                                            .value !=
                                                        null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      height: 68,
                                                      width: 68,
                                                      fit: BoxFit.fill,
                                                      "${configModel?.baseUrls?.customerImageUrl}/${controller.userInfoModel?.value.image}",
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return errorImage(
                                                            68, 68);
                                                      },
                                                    ),
                                                  )
                                                : Image.asset(
                                                    "assets/profile.png",
                                                    height: 68)),
                                        Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(() => controller
                                                          .isLoading.value ==
                                                      true
                                                  ? SizedBox(
                                                      width: 200.0,
                                                      height: 30.0,
                                                      child: Shimmer.fromColors(
                                                        baseColor: Colors.white,
                                                        highlightColor:
                                                            Colors.white,
                                                        child: Text(
                                                          '     ',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 10.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 200,
                                                      child: Text(
                                                        controller.userInfoModel !=
                                                                    null &&
                                                                controller
                                                                        .userInfoModel
                                                                        .value !=
                                                                    null
                                                            ? controller
                                                                .userInfoModel
                                                                .value
                                                                .name
                                                                .toString()
                                                            : "",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    )),
                                              Obx(() => controller
                                                          .isLoading.value ==
                                                      true
                                                  ? SizedBox(
                                                      width: 200.0,
                                                      height: 30.0,
                                                      child: Shimmer.fromColors(
                                                        baseColor: Colors.grey,
                                                        highlightColor:
                                                            Colors.grey,
                                                        child: Text(
                                                          '     ',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 10.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Text(
                                                      controller.userInfoModel !=
                                                                  null &&
                                                              controller
                                                                      .userInfoModel
                                                                      .value !=
                                                                  null
                                                          ? controller
                                                              .userInfoModel
                                                              .value
                                                              .email
                                                              .toString()
                                                          : "",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              137, 137, 137, 1),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    )),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfile(),
                                                ));
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                Icons.edit_outlined,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),

                                  const Divider(
                                      thickness: 3,
                                      color: Color.fromRGBO(245, 245, 245, 1)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 10),
                                        child: Text(
                                          "Settings".tr,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          settingsCard(
                                            title: "My Fuels Card".tr,
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MyFuelsCard(),
                                                )),
                                          ),
                                          const Divider(),
                                          settingsCard(
                                              title: "My Location".tr,
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MyAddressScreen(),
                                                    ));
                                              }),
                                          const Divider(),
                                          settingsCard(
                                              title: "My Assets".tr,
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfileAssets()))),
                                          const Divider(),
                                          settingsCard(
                                              title: "Change Language".tr,
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LanguageScreen(
                                                            isLogin: true,
                                                          )))),
                                          const Divider(),
                                          settingsCard(
                                              title: "Contact Us".tr,
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ContactUs()))),
                                          const Divider(),
                                          settingsCard(
                                            title: "Change Password".tr,
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ChangePassword(),
                                                )),
                                          ),
                                          const Divider(),
                                          settingsCard(
                                              title: "Privacy Policy".tr,
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PrivacyolicyScreen(),
                                                    ));
                                              }),
                                          const Divider(),
                                          settingsCard(
                                              title: "Terms and Conditions".tr,
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TermsConditionScreen(),
                                                    ));
                                              }),
                                          const Divider(),
                                          settingsCard(
                                              title: "FAQS".tr,
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const FAQScreen(),
                                                    ));
                                              }),
                                          const Divider(),
                                        ],
                                      ),

                                      // Tap to Logout

                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  const LogoutPage());
                                        },
                                        child: Container(
                                          height: 48,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: Text(
                                            "Logout".tr,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// settings card
class settingsCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  settingsCard({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
