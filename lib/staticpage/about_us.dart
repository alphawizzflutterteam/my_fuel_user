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
              return Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor:
                          Colors.transparent, // Remove the divider line
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "Q.${configModel!.vendorFaq![index].question}",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      children: [
                        Column(
                          children: [
                            Divider(
                              color: Colors.grey,
                              height: 0.5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 5),
                                  child: Text(
                                      "Answer.${configModel!.vendorFaq![index].answer}"),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
