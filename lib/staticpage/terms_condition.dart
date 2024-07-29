import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../components/my_appbar.dart';
import '../controller/splash_controller.dart';
import '../splashScreen.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(" Data Show ${configModel!.termsConditions}");
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const MyAppbar(title: 'Terms & Conditions'),
                  Html(
                    // data: htmlContent,
                    data: '''
                    <!DOCTYPE html> ${configModel!.termsConditions} </html>
    ''',
                  )
                ],
              ),
            ),
          );
        });
  }

  final String htmlContent = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Content Design Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
        }
        .content-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .content-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .content-text {
            font-size: 14px;
            line-height: 1.6;
        }
    </style>
</head>
<body>

<div class="content-container">
    <div class="content-title">Lorem Ipsum is simply dummy text of the printing and typesetting</div>
    <div class="content-text">
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
    </div>
</div>

<div class="content-container">
    <div class="content-title">Lorem Ipsum is simply dummy text of the printing and typesetting</div>
    <div class="content-text">
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen bookLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
    </div>
</div>

<div class="content-container">
    <div class="content-title">Lorem Ipsum is simply dummy text of the printing and typesetting</div>
    <div class="content-text">
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
    </div>
</div>

</body>
</html>
''';
}
