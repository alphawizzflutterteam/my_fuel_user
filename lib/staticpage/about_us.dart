import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/splashScreen.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'FAQ'),
      body: Column(
        children: [
          ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: configModel!.vendorFaq!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "Q.${configModel!.vendorFaq![index].question}",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle:
                    Text("Answer.${configModel!.vendorFaq![index].answer}"),
              );
            },
          )
        ],
      ),
    );
  }
}
