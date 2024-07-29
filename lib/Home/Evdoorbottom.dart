import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/Home/fuel_ontab_checkout.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/data/model/TimeSlotModel.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/vendors_page.dart';

import '../Home/Evcheckout.dart';

class Evdoorbottom extends StatefulWidget {
  const Evdoorbottom(
      {super.key,
      this.onTab,
      required this.slotList,
      required this.selectedSlot,
      required this.onSelect,
      required this.dateController});

  final VoidCallback? onTab;
  final Function(int) onSelect;
  final List<TimeData> slotList;
  final int selectedSlot;
  final TextEditingController dateController;

  @override
  State<Evdoorbottom> createState() => _EvdoorbottomState();
}

class _EvdoorbottomState extends State<Evdoorbottom> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 20),
              child: Text(
                "Schedule data and timing",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: widget.dateController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 10),
                    // labelText: 'Schedule date and timing',
                    hintText: 'Schedule date and timing',

                    //filled: true,
                    suffixIcon: Icon(Icons.calendar_today),
                    /*enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),*/
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  }),
            ),
            const SizedBox(height: 7),
            const Padding(
              padding: EdgeInsets.only(right: 290),
              child: Text(
                "Slots",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 5,
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                children: List.generate(
                  widget.slotList.length,
                  (index) => InkWell(
                    onTap: () {
                      widget.onSelect(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                            border: Border.all(
                                color: widget.selectedSlot == index
                                    ? colors.orange
                                    : colors.black54)),
                        height: 35,
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            widget.slotList[index].title ?? '',
                            style: TextStyle(
                                fontSize: 15,
                                color: widget.selectedSlot == index
                                    ? colors.orange
                                    : colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.bottomCenter,
              width: 330,
              child: GestureDetector(
                  onTap: widget.onTab,
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Evcheckout()))*/
                  child: const MyButton(text: 'Book Now')),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      setState(() {
        //   selectedDate = picked;
        widget.dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
