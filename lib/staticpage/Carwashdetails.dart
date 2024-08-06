import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/widgets/globle_widgets.dart';
import 'package:test_prj/orderfuel/EV/checkout_page.dart';

import '../Home/checkout_car_service.dart';
import '../components/my_button.dart';
import '../data/model/VendorServiceProductModel.dart';
import '../helper/colors.dart';
import '../helper/utils/validator_all.dart';
import '../home_page.dart';
import '../routes/app_routes.dart';
import '../splashScreen.dart';

class Carwashdetails extends StatefulWidget {
  SellerData? sellerData;

  Carwashdetails({super.key, this.sellerData});
  @override
  State<Carwashdetails> createState() => _CarwashdetailsState();
}

class _CarwashdetailsState extends State<Carwashdetails> {
  int selectedIndex = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFF3B781F), Color(0xFF8AB402)],
            stops: [0, 1],
            begin: AlignmentDirectional(0.94, -1),
            end: AlignmentDirectional(-0.94, 1),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: 16.0), // Optional padding for inner elements
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.white,

          // backgroundColor: Colors.grey.shade200,
          onPressed: () async {
            if (selectedIndex == -1) {
              Fluttertoast.showToast(msg: "Please select one product");
              return;
            }

            Get.toNamed(Routes.CarCheckout);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Checkout_Car_Service()));
            // var data = await Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => MyFullAssets(),
            //     ));
            //
            // if (data != null) {
            //   controller.getAssets();
            // }
            // Navigato
            // Add your onPressed logic here
          },
          label: Text(
            'Book Service Now',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),

          // Optionally, adjust other properties like background color, elevation, etc.
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Color.fromRGBO(211, 83, 7, 1),
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(252, 130, 59, 1),
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
                      padding: const EdgeInsets.only(top: 45.0, left: 20),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 30),
                    child: Text(
                      '${widget.sellerData!.seller!.fName!.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              // elevation: 3,
              //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

              child: Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '${configModel?.baseUrls?.sellerImageUrl}/${widget.sellerData?.seller?.image}',
                          height: 130,
                          width: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return errorImage(100, 100);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.sellerData!.seller!.fName!.toString()}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 5),
                                Text(
                                  "${widget.sellerData!.seller!.shop!.address!.toString()}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7),
                            Row(
                              children: [
                                Text(
                                  widget.sellerData?.products?.length == 0
                                      ? "₹ ${widget.sellerData?.products?[0].unitPrice}"
                                      : "₹ ${0.0}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 18,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '0.0',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "About",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 245.0),
                        child: Container(
                            height: 20,
                            child: Image.asset(
                              "assets/Notification.png",
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the "
                      "printing and typesetting industry. Lorem Ipsum has "
                      "been the industry's standard dummy text ever since the 1500s",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 25,
                child: Row(
                  children: [
                    Image.asset("assets/Notification.png"),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset("assets/Notification.png"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 250),
              child: Text(
                "Products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.sellerData?.products?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      otherCategory.productId =
                          widget.sellerData!.products?[index].id.toString();

                      selectedIndex = index;

                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: colors.lightgray,
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.deepOrangeAccent
                              : colors.lightgray,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        color: selectedIndex == index
                            ? colors.lightgray
                            : Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // Add additional decoration properties here as needed
                              ),
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                // Use ClipRRect to clip the image with the specified border radius
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  widget.sellerData!.products?[index].images ==
                                          null
                                      ? ""
                                      : "${configModel!.baseUrls!.productThumbnailUrl}/${widget.sellerData!.products?[index].thumbnail}",
                                  errorBuilder: (context, error, stackTrace) {
                                    return errorImage(100, 100);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${widget.sellerData!.products![index].name}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${widget.sellerData!.products![index].slug}',
                                  style: TextStyle(color: colors.greyTemp),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    '₹ ${widget.sellerData!.products![index].unitPrice}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 250),
              child: Text(
                "Reviews",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //SizedBox(height: 5),
            Column(
              children: [
                Container(
                  height: 110,
                  width: 320,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 65),
                              child: Text(
                                "0.0",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 60),
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,

                                itemSize: 22, // Reduced size
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),

                                onRatingUpdate: (double value) {},
                                // {
                                //   print(rating);
                                // },
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 45),
                              child: Text(
                                "14,575 Global Rating",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: VerticalDivider(
                          thickness: 1,
                          color: Colors.black26,
                          indent: 10,
                          endIndent: 9,
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 5),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('5'),
                                  ),
                                  Container(
                                    width: 95,
                                    height: 5,
                                    child: LinearProgressIndicator(
                                      value: 1,
                                      backgroundColor: Colors.grey,
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.blue),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text('4'),
                                ),
                                Container(
                                  width: 93,
                                  height: 5,
                                  child: LinearProgressIndicator(
                                    value: 0.8,
                                    backgroundColor: Colors.grey,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.green),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text('3'),
                                ),
                                Container(
                                  width: 93,
                                  height: 5,
                                  child: LinearProgressIndicator(
                                    value: 0.6,
                                    backgroundColor: Colors.grey,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.yellow),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text('2'),
                                ),
                                Container(
                                  width: 93,
                                  height: 5,
                                  child: LinearProgressIndicator(
                                    value: 0.4,
                                    backgroundColor: Colors.grey,
                                    valueColor: AlwaysStoppedAnimation(
                                        Color.fromARGB(181, 249, 82, 138)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text('1'),
                                ),
                                Container(
                                  width: 93,
                                  height: 5,
                                  child: LinearProgressIndicator(
                                    value: 0.2,
                                    backgroundColor: Colors.grey,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.red),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.sellerData!.reviews?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Padding(
                            padding: EdgeInsets.all(1),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      'https://media.istockphoto.com/id/1330589502/photo/electric-vehicle-charging-station.jpg?s=1024x1024&w=is&k=20&c=gwve61BLBc9djE8P9Qp-2KSxS-ehZtvlcTW6AKy4DOA=',
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${widget.sellerData!.reviews![index].user?.fName}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text(
                                                "${widget.sellerData!.reviews![index].createdAt.toString()}",
                                                // "${Validator.convertDateString()}",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IgnorePointer(
                                          child: RatingBar.builder(
                                            initialRating: double.parse(widget
                                                .sellerData!
                                                .reviews![index]
                                                .rating
                                                .toString()),
                                            minRating: 2,
                                            direction: Axis.horizontal,
                                            itemSize: 22,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 0.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Text(
                            "Comment :${widget.sellerData!.reviews![index].comment}",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              'https://media.istockphoto.com/id/1330589502/photo/electric-vehicle-charging-station.jpg?s=1024x1024&w=is&k=20&c=gwve61BLBc9djE8P9Qp-2KSxS-ehZtvlcTW6AKy4DOA=',
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Wade Warren",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text(
                                        "02 Jun 23, 04:55",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 2,
                                  direction: Axis.horizontal,
                                  itemSize: 22,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // Padding(
                //   padding: const EdgeInsets.only(left: 15, right: 10),
                //   child: Text(
                //     "Lorem Ipsum is simply dummy text of the "
                //     "printing and typesetting industry.",
                //     style: TextStyle(fontSize: 14, color: Colors.black54),
                //   ),
                // ),
                // SizedBox(height: 5),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //   child: Padding(
                //     padding: EdgeInsets.all(1),
                //     child: Row(
                //       children: [
                //         Container(
                //           height: 40,
                //           width: 40,
                //           margin: EdgeInsets.only(right: 10),
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(50),
                //             child: Image.network(
                //               'https://media.istockphoto.com/id/1330589502/photo/electric-vehicle-charging-station.jpg?s=1024x1024&w=is&k=20&c=gwve61BLBc9djE8P9Qp-2KSxS-ehZtvlcTW6AKy4DOA=',
                //               height: 40,
                //               width: 40,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           child: Padding(
                //             padding: EdgeInsets.symmetric(vertical: 0),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Text(
                //                       "Wade Warren",
                //                       style: TextStyle(
                //                         fontSize: 18,
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.only(left: 30),
                //                       child: Text(
                //                         "02 Jun 23, 04:55",
                //                         style: TextStyle(
                //                           fontSize: 15,
                //                           color: Colors.black54,
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //
                //                 // SizedBox(height: 8),
                //                 RatingBar.builder(
                //                   initialRating: 3,
                //                   minRating: 1,
                //                   direction: Axis.horizontal,
                //                   itemSize: 22,
                //                   itemCount: 5,
                //                   itemPadding:
                //                       EdgeInsets.symmetric(horizontal: 0.0),
                //                   itemBuilder: (context, _) => Icon(
                //                     Icons.star,
                //                     color: Colors.amber,
                //                   ),
                //                   onRatingUpdate: (rating) {
                //                     print(rating);
                //                   },
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 5),
                // Padding(
                //   padding: const EdgeInsets.only(left: 15, right: 10),
                //   child: Text(
                //     "Lorem Ipsum is simply dummy text of the "
                //     "printing and typesetting industry.",
                //     style: TextStyle(fontSize: 14, color: Colors.black54),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),

                // InkWell(
                //   onTap: () {
                //     if (selectedIndex == -1) {
                //       Fluttertoast.showToast(msg: "Please select one product");
                //       return;
                //     }
                //
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Checkout_Car_Service()));
                //
                //     // Add your onTap logic here
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       child: const MyButton(
                //         text: "Book Service Now",
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: TextButton(
                //     onPressed: () {
                //       // Add your send button functionality here
                //     },
                //     style: TextButton.styleFrom(
                //       backgroundColor: Colors.green,
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 10, vertical: 10),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 55),
                //           child: GestureDetector(
                //             onTap: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) => CheckOut()));
                //             },
                //             child: Container(
                //               child: const MyButton(
                //                 text: "Book Service Now",
                //               ),
                //               // child: Text(
                //               //   'Book Service Now',
                //               //   style:
                //               //   TextStyle(color: Colors.white, fontSize: 18),
                //               // ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(width: 80),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),

            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
