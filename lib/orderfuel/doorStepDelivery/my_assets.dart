import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/assets_page.dart';

class MyAssets extends StatefulWidget {
  const MyAssets({super.key});

  @override
  State<MyAssets> createState() => _AssetsState();
}

class _AssetsState extends State<MyAssets> {
  int selectedValue = 1;

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedValue = index;
        });
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(280, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        side: BorderSide(
          color: (selectedValue == index) ? Colors.black : Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: (selectedValue == index) ? Colors.black : Colors.blueGrey,
            ),
          ),
          Radio<int>(
            value: index,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 45.0, left: 20),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 45.0, left: 100),
                    child: Text(
                      'Assets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  customRadio("Genset", 1),
                  const SizedBox(
                    height: 10,
                  ),
                  customRadio("Heavy Machinery", 2),
                  const SizedBox(
                    height: 10,
                  ),
                  customRadio("Equipments", 3),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 219),
              child: Text(
                'Add Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 73,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Asset Name (eg: genset1)',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 73,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Asset Capacity/Power (eg: 120kva)',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 73,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Fuel capacity(eg: 200 litres)',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AssetsPage(),
                        )),
                    child: const MyButton(text: 'Add Asset type')),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
