import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/widgets/globle_widgets.dart';
import 'package:test_prj/repository/model/user_model.dart';
import 'package:test_prj/splashScreen.dart';

import '../components/my_appbar.dart';
import 'package:get/get.dart';
// import 'package:test_prj/components/my_appbar.dart';
// import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/helper/utils/validator_all.dart';
//
import '../controller/cart_controller.dart';
import '../controller/profile_controller.dart';
import '../controller/singup_controller.dart';
import '../routes/app_routes.dart';
// import '../data/model/assetlist_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKeyReset = GlobalKey<FormState>();
  String data = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController comapnyNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController gstController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController msmeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController guestIdController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initUI();
  }
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController comapnyNameController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  //
  // TextEditingController gstController = TextEditingController();
  // TextEditingController panController = TextEditingController();
  // TextEditingController msmeController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController confirmpasswordController = TextEditingController();
  // TextEditingController guestIdController = TextEditingController();

  void initUI() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProfileController controller = Get.find();
      controller.getProfile().then((value) {
        nameController.text = controller.userInfoModel.value.fName.toString();
        phoneController.text = controller.userInfoModel.value.phone.toString();
        emailController.text = controller.userInfoModel.value.email.toString();
        comapnyNameController.text =
            controller.userInfoModel.value.name.toString();
        // addressController.text =
        //     controller.userInfoModel.value.apartmentNo.toString() +
        //         controller.userInfoModel.value.houseNo.toString() +
        //         controller.userInfoModel.value.city.toString();
        // gstController.text = controller.userInfoModel.value.gst.toString();
        // panController.text = controller.userInfoModel.value.pan.toString();
        // msmeController.text = controller.userInfoModel.value.msme.toString();
      });
      setState(() {});
    });
  }

  Future<void> ProfileImage() async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 400,
        maxHeight: 400);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  File? profileImage;
  Future<void> ProfileImage1() async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 400,
        maxHeight: 400);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  imagePick() {
    return Container(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 23),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                ProfileImage1();
              },
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Camera".tr,
                    style: const TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                ProfileImage();
              },
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/gallery.png",
                    height: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Gallery".tr,
                    style: const TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Image Value  ${profileImage}");
    return Scaffold(
      appBar: MyAppbar(title: "Edit Profile"),
      body: Form(
        key: _formKeyReset,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                GetBuilder<ProfileController>(builder: (profileController) {
                  return GetBuilder<SignupController>(
                      builder: (signUpController) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                              'assets/login-logo.png',
                            ))),
                            // color: Colors.deepOrange,
                            child: ClipOval(
                              child: profileImage != null
                                  ? Image.file(
                                      profileImage!,
                                      height: 125,
                                      width: 125,
                                      fit: BoxFit.cover,
                                    )
                                  : profileController
                                                  .userInfoModel.value?.image ==
                                              null ||
                                          profileController
                                                  .userInfoModel.value?.image ==
                                              '' ||
                                          profileController
                                                  .userInfoModel.value?.image ==
                                              'def.png'
                                      ? SizedBox()
                                      : Image.network(
                                          '${configModel?.baseUrls?.customerImageUrl}${Get.find<ProfileController>().userInfoModel?.value.image}',
                                          height: 125,
                                          width: 125,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return errorImage(125, 125);
                                          },
                                        ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => imagePick(),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 105.0, left: 80),
                            child: Image.asset(
                              "assets/Editicon.png",
                              height: 25,
                            ),
                          ),
                        ),
                      ],
                    );
                  });
                }),

                // App Icon
                // Center(
                //   child: Image.asset(
                //     "assets/login-logo.png",
                //     height: 62,
                //   ),
                // ),
                // const SizedBox(height: 10),
                // Center(
                //   child: const Text(
                //     "Edit Profile",
                //     style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                //   ),
                // ),
                const SizedBox(height: 8),
                // const Text(
                //   "Please Sign in to your account",
                // ),

                // data == "1" ? showBussiness() :
                showUser(),

                const SizedBox(height: 20),
                GetBuilder<SignupController>(
                    init: SignupController(),
                    builder: (controller) {
                      return controller.isLoading.value == true
                          ? Center(child: CircularProgressIndicator())
                          : GestureDetector(
                              onTap: () {
                                if (_formKeyReset!.currentState!.validate()) {
                                  UpdateProfile user = UpdateProfile();
                                  user.fName = nameController.text;
                                  user.lName = nameController.text;
                                  user.email = emailController.text;
                                  user.phone = phoneController.text;
                                  // user.gst = gstController.text;
                                  // user.guest_id = "123";
                                  // user.address = addressController.text;
                                  // user.pan = panController.text;
                                  // user.msme = msmeController.text;
                                  // user.password = passwordController.text;
                                  // user.profile =
                                  //     data == "0" ? "normal" : "bussiness";

                                  controller.UpdateProfileA(user).then((value) {
                                    if (value.containsKey("errors")) {
                                      Fluttertoast.showToast(msg: "$value");
                                    } else if (value['temporary_token'] != "") {
                                      String token =
                                          value['temporary_token'].toString();
                                      Get.offAllNamed(Routes.HOME);

                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             OTPScreen2(a )));
                                    }

                                    // return null;
                                  });
                                }
                              },
                              child: const MyButton(text: "Update Profile"));
                    }),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showBussiness() {
    return Column(
      children: [
        const SizedBox(height: 25),
        MyTextField(
          validator: (value) => Validator.validatePhone(value),
          isAmount: true,
          controller: phoneController,
          labelText: Text("Phone No "),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateEmail(value),
          controller: emailController,
          labelText: Text("Email"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateName(value),
          controller: nameController,
          labelText: Text("Company Name"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => null,
          controller: gstController,
          labelText: Text("Gst Number (optional)"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateAddress(value),
          controller: addressController,
          labelText: Text("Company Address"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateAddress(value),
          controller: panController,
          labelText: Text("Pan No."),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => null,
          controller: msmeController,
          labelText: Text("MSME No.(optional)"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: passwordController,
          labelText: Text("Password"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: confirmpasswordController,
          labelText: Text("Confirm Password"),
        ),
      ],
    );
  }

  Widget showUser() {
    return Column(
      children: [
        const SizedBox(height: 25),
        MyTextField(
          validator: (value) => Validator.validatePhone(value),
          controller: phoneController,
          isAmount: true,
          labelText: Text("Phone No "),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateEmail(value),
          controller: emailController,
          labelText: Text("Email"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateName(value),
          controller: nameController,
          labelText: Text("Full Name"),
        ),
        SizedBox(height: 15),
        // MyTextField(
        //   validator: (value) => null,
        //   controller: gstController,
        //   labelText: Text("Gst Number (optional)"),
        // ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => null,
          isPassword: true,
          controller: passwordController,
          labelText: Text("Password"),
        ),
      ],
    );
  }
}
