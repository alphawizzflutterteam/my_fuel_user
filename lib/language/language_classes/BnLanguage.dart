import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bangla extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "bn_IN": {
          "User Name": "ব্যবহারকারীর নাম",
          "Enter your Mobile Number ": "আপনার মোবাইল নম্বর লিখুন",
          "Login with your id": "আপনার আইডি দিয়ে লগইন করুন",
          "Confirm Password": "পাসওয়ার্ড নিশ্চিত করুন",
          "Create Password": "পাসওয়ার্ড তৈরি করুন",
          "Forgot Password": "পাসওয়ার্ড ভুলে গেছেন",
          "Enter your Email": "আপনার ইমেইল লিখুন",
          "We Have sent the 4 digit Verification code":
              "আমরা ৪ অঙ্কের ভেরিফিকেশন কোড পাঠিয়েছি",
          "Resend OTP": "OTP আবার পাঠান",
          "Verify": "যাচাই করুন",
          "Didn't received Otp?": "OTP পাননি?",
          "Please Sign in to your account":
              "দয়া করে আপনার অ্যাকাউন্টে সাইন ইন করুন",
          "Next": "পরবর্তী",
          "Personal": "ব্যক্তিগত",
          "Business": "ব্যবসা",
          "Reset it": "রিসেট করুন",
          "Don't Have an account?": "অ্যাকাউন্ট নেই?",
          "Phone No. Or Email": "ফোন নম্বর অথবা ইমেইল",
          "Please enter Phone No. Or Email":
              "দয়া করে ফোন নম্বর অথবা ইমেইল লিখুন",
          "Sign Up": "সাইন আপ করুন",
          "Please Enter Password": "দয়া করে পাসওয়ার্ড লিখুন",
          "Password": "পাসওয়ার্ড",
          "Login": "লগইন করুন",
          "Enter verification code": "যাচাইকরণ কোড লিখুন",
          "Enter the OTP sent to": "পাঠানো OTP লিখুন",
          "Don't received OTP? ": "OTP পাননি?",
          "Your My Fuels Card is Ready": "আপনার মাই ফিউয়েলস কার্ড প্রস্তুত",
          "Congratulations": "অভিনন্দন",
          "Every Drop Matters": "প্রতিটি ফোঁটা গুরুত্বপূর্ণ",
          "Member Since": "সদস্য হয়েছেন",
          "Card added to your profile": "কার্ড আপনার প্রোফাইলে যোগ করা হয়েছে",
          "Full Name": "পূর্ণ নাম",
          "Gst Number": "GST নম্বর",
          "Price": "মূল্য",
          "Filter": "ফিল্টার",
          "Minimum": "ন্যূনতম",
          "Maximum": "সর্বোচ্চ",
          "Apply": "প্রয়োগ করুন",
          "Cancel": "বাতিল করুন",
          "Rating": "রেটিং",
          "Above": "উপরে",
          "Full Service": "সম্পূর্ণ পরিষেবা",
          "Car Service": "গাড়ির পরিষেবা",
          "Engine Oil": "ইঞ্জিন তেল",
          "Periodic Service": "পর্যায়ক্রমিক পরিষেবা",
          "Others": "অন্যান্য",
          "Schedule Car Service": "গাড়ির পরিষেবা নির্ধারণ করুন",
          "Schedule data and timing": "তারিখ ও সময় নির্ধারণ করুন",
          "Slots": "স্লট",
          "Book Now": "এখনই বুক করুন",
          "Car Wash": "গাড়ি ধোয়া",
          "Search": "অনুসন্ধান করুন",
          "Star Car Wash": "স্টার কার ওয়াশ",
          " ring Road": " রিং রোড",
          "to": "থেকে",
          "Checkout": "চেকআউট",
          "Delivery Address": "ডেলিভারি ঠিকানা",
          "Home": "বাড়ি",
          "Change or add new address":
              "ঠিকানা পরিবর্তন করুন বা নতুন ঠিকানা যোগ করুন",
          "Car & tyres detail": "গাড়ি ও টায়ারের বিবরণ",
          "Vehicle Manufacture": "যানবাহন নির্মাণ",
          "Model": "মডেল",
          "Booking Date": "বুকিং তারিখ",
          "Tyres": "টায়ার",
          "Monday": "সোমবার",
          "August": "আগস্ট",
          "Price Detail": "মূল্য বিবরণ",
          "Tyres Price": "টায়ারের দাম",
          "Service": "পরিষেবা",
          "Total Amount": "মোট পরিমাণ",
          "Scheduled Date and Time": "নির্ধারিত তারিখ ও সময়",
          "Delivery free": "ডেলিভারি ফ্রি",
          "Discount": "ছাড়",
          "Need to Update Pricing": "মূল্য আপডেট করতে হবে",
          "Schedule date and timing": "তারিখ ও সময় নির্ধারণ করুন",
          "My Fuels Price": "মাই ফিউয়েলস দাম",
          "Diesel": "ডিজেল",
          "Vendor Name": "বিক্রেতার নাম",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry":
              "লোরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি টেক্সট",
          "Fuel On Tap Detail": "ফুয়েল অন ট্যাপ বিবরণ",
          "MRP": "এমআরপি",
          "Add Fuel Quantity": "জ্বালানির পরিমাণ যোগ করুন",
          "Add Quantity": "পরিমাণ যোগ করুন",
          "Assets": "সম্পদ",
          "Add Details": "বিবরণ যোগ করুন",
          "Asset Name": "সম্পদের নাম",
          "Asset Capacity": "সম্পদের ক্ষমতা",
          "Fuel capacity": "জ্বালানির ক্ষমতা",
          "Add Asset type": "সম্পদের ধরন যোগ করুন",
          "Genset Maintenance": "জেনসেট রক্ষণাবেক্ষণ",
          "Engine oil filter": "ইঞ্জিন তেল ফিল্টার",
          "Preodic Service": "পর্যায়ক্রমিক পরিষেবা",
          "RSP": "আরএসপি",
          "Delivery Fee": "ডেলিভারি ফি",
          "GST(On Delivery Fee)": "GST (ডেলিভারি ফি-তে)",
          "Other Charges": "অন্যান্য চার্জ",
          "Insurance": "বীমা",
          "Vehicle No.": "যানবাহনের নম্বর",
          "Email": "ইমেইল",
          "Mobile No.": "মোবাইল নম্বর",
          "Submit": "জমা দিন",
          "On of our agents will connect":
              "আমাদের একজন এজেন্ট আপনাকে যোগাযোগ করবে",
          "you shortly": "শীঘ্রই",
          "Back to home": "বাড়িতে ফিরে যান",
          "Rescue Me": "আমাকে উদ্ধার করুন",
          "Select Vehicle": "যানবাহন নির্বাচন করুন",
          "Select Services": "পরিষেবা নির্বাচন করুন",
          "Fuel Type": "জ্বালানির ধরন",
          "Fuel Quantity": "জ্বালানির পরিমাণ",
          "Done": "সম্পন্ন",
          "Tyres Listing": "টায়ারের তালিকা",
          "Perfinza CLX1": "পারফিনজা CLX1",
          "Schedule Day": "দিন নির্ধারণ করুন",
          "Door Step ": "দোরগোড়া",
          "Select Date & Slot": "তারিখ ও স্লট নির্বাচন করুন",
          "Schedule date": "তারিখ নির্ধারণ করুন",
          "Note to service provider": "পরিষেবা প্রদানকারীর জন্য নোট",
          "Continue": "চালিয়ে যান",
          "Cancel Order Reason": "আদেশ বাতিল করার কারণ",
          "Select Car Type": "গাড়ির ধরন নির্বাচন করুন",
          "Select your vehicle type": "আপনার যানবাহনের ধরন নির্বাচন করুন",
          "Bottam sheet": "বটম শিট",
          "Lorem lpush is simply dumm": "লোরেম এলপুশ হল শুধু ডামি টেক্সট",
          "Order ID": "অর্ডার আইডি",
          "Sold by:Seller": "বিক্রেতা দ্বারা বিক্রি হয়েছে",
          "Time": "সময়",
          "Date": "তারিখ",
          "Delivery Required an OTP": "ডেলিভারি জন্য OTP প্রয়োজন",
          "Share the otp to delivery boy ": "ডেলিভারি বয়কে OTP শেয়ার করুন",
          "Alert Dialog": "সতর্কতা সংলাপ",
          "Close": "বন্ধ করুন",
          "Write Review": "রিভিউ লিখুন",
          "Address": "ঠিকানা",
          "Phone": "ফোন",
          "Review": "রিভিউ",
          "Description": "বিবরণ",
          "Write here": "এখানে লিখুন",
          "Charging Station": "চার্জিং স্টেশন",
          "Order Fuel": "জ্বালানি অর্ডার করুন",
          "Door Step Delivery": "দোরগোড়া ডেলিভারি",
          "Products & Services": "পণ্য ও পরিষেবা",
          "Enter Your Vehicle Number": "আপনার যানবাহনের নম্বর লিখুন",
          "Vehicle Number": "যানবাহনের নম্বর",
          "Select a Tyres For your Vehicle":
              "আপনার যানবাহনের জন্য টায়ার নির্বাচন করুন",
          "Select Vehicle Manufacture Type":
              "যানবাহন নির্মাণের ধরন নির্বাচন করুন",
          "Select Model": "মডেল নির্বাচন করুন",
          "Tyre Size": "টায়ারের আকার",
          "lorem lpsum is simply dummy text of the printing and typesetting industry":
              "লোরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি টেক্সট",
          "Fuel Management Services": "জ্বালানি ব্যবস্থাপনা পরিষেবা",
          "Monthly Consumption": "মাসিক খরচ",
          "Number of assets": "সম্পদের সংখ্যা",
          "Number of Locations": "লোকেশনের সংখ্যা",
          "My Fuels Product": "মাই ফিউয়েলস পণ্য",
          "Order Now": "এখনই অর্ডার করুন",
          "Vendor Details": "বিক্রেতার বিবরণ",
          "Speed Petrol": "স্পিড পেট্রোল",
          "Schedule Time": "সময় নির্ধারণ করুন",
          "Shopping address": "শপিং ঠিকানা",
          "Track Order": "অর্ডার ট্র্যাক করুন",
          "Ordered Saturday": "শনিবার অর্ডার করেছেন",
          "Delivered": "ডেলিভার করা হয়েছে",
          "Service Charges": "পরিষেবা চার্জ",
          "DISCOUNT": "ছাড়",
          "Best Offers": "সেরা অফার",
          "Offer": "অফার",
          "Expires": "মেয়াদ শেষ",
          "Order Detail": "অর্ডারের বিবরণ",
          "Out for delivery": "ডেলিভারির জন্য বেরিয়েছে",
          "Pickup & Delivery Address": "পিকআপ ও ডেলিভারি ঠিকানা",
          "Settings": "সেটিংস",
          "My Fuels Card": "মাই ফিউয়েলস কার্ড",
          "My Location": "আমার অবস্থান",
          "Change Language": "ভাষা পরিবর্তন করুন",
          "Contact Us": "যোগাযোগ করুন",
          "Change Password": "পাসওয়ার্ড পরিবর্তন করুন",
          "Privacy Policy": "গোপনীয়তা নীতি",
          "Terms and Conditions": "শর্তাবলী",
          "Logout": "লগআউট",
          "Select Type": "ধরন নির্বাচন করুন",
          "Select Address": "ঠিকানা নির্বাচন করুন",
          "Use My Location": "আমার অবস্থান ব্যবহার করুন",
          "Select Delivery type": "ডেলিভারির ধরন নির্বাচন করুন",
          "Name": "নাম",
          "Enter your name": "আপনার নাম লিখুন",
          "Mobile Number": "মোবাইল নম্বর",
          "Alternate Mobile number": "বিকল্প মোবাইল নম্বর",
          "Enter your Alternate Mobile number":
              "আপনার বিকল্প মোবাইল নম্বর লিখুন",
          "Home address": "বাড়ির ঠিকানা",
          "Road name,Area": "রাস্তানাম, এলাকা",
          "Enter your Road name ,area colony":
              "আপনার রাস্তানাম, এলাকা উপনিবেশ লিখুন",
          "Shipping Address": "শিপিং ঠিকানা",
          "New Address": "নতুন ঠিকানা",
          "Billing Address": "বিলিং ঠিকানা",
          "Same as Shipping address": "শিপিং ঠিকানার মতো একই",
          "House no., Building Name": "বাড়ি নম্বর, বিল্ডিং নাম",
          "Enter your Home no.. Building Name":
              "আপনার বাড়ি নম্বর, বিল্ডিং নাম লিখুন",
          "Country": "দেশ",
          "Enter your country name": "আপনার দেশের নাম লিখুন",
          "State": "রাজ্য",
          "Enter your State name": "আপনার রাজ্যের নাম লিখুন",
          "City": "শহর",
          "Enter your city name": "আপনার শহরের নাম লিখুন",
          "Pincode": "পিনকোড",
          "Enter your Pincode": "আপনার পিনকোড লিখুন",
          "Save Address": "ঠিকানা সংরক্ষণ করুন",
          "Car": "গাড়ি",
          "Pick Up": "পিক আপ",
          "Open Bottom Sheet": "নীচের শীট খুলুন",
          "Download Invoice": "ইনভয়েস ডাউনলোড করুন",
          "About": "সম্পর্কে",
          "Wade Warren": "ওয়েড ওয়ারেন",
          "Book Service Now": "এখনই পরিষেবা বুক করুন",
          "Completed": "সম্পন্ন",
          "Schedule": "তালিকা",
          "Fuels": "জ্বালানি",
          "Rescue fuel": "উদ্ধার জ্বালানি",
          "On the way": "পথে",
          "Fuel to go": "জ্বালানি নিন",
          "Order Cancelled": "অর্ডার বাতিল হয়েছে",
          "CNG": "সিএনজি",
          "Order Saturday": "শনিবার অর্ডার",
          "Saturday": "শনিবার",
          "Cancel Order": "অর্ডার বাতিল করুন",
          "Order Placed Successfully": "অর্ডার সফলভাবে স্থাপন করা হয়েছে",
          "Points added to your": "আপনার পয়েন্ট যোগ করা হয়েছে",
          "Rate Driver": "ড্রাইভারকে রেটিং দিন",
          "Submit Review": "রিভিউ জমা দিন",
          "Payment": "পেমেন্ট",
          "Card Number": "কার্ড নম্বর",
          "Expiry Date": "মেয়াদ শেষের তারিখ",
          "CVV": "CVV",
          "Pay Now": "এখনই পেমেন্ট করুন",
          "Payment Type": "পেমেন্ট ধরন",
          "Select payment method": "পেমেন্ট পদ্ধতি নির্বাচন করুন",
          "Visa": "ভিসা",
          "Phone Pay": "ফোন পে",
          "UPI Payment": "UPI পেমেন্ট",
          "Google Pay": "গুগল পে",
          "Pay by My fuels card": "মাই ফিউয়েলস কার্ড দিয়ে পেমেন্ট করুন",
          "Available balance": "উপলব্ধ ব্যালেন্স",
          "Add Money": "টাকা যোগ করুন",
          "PhonePe": "ফোনপে",
          "Pay at Station": "স্টেশনে পেমেন্ট করুন",
          "Buy now pay later": "এখন কিনুন পরে পেমেন্ট করুন",
          "Road name, Area Colony": "রাস্তানাম, এলাকা উপনিবেশ",
          "New Password": "নতুন পাসওয়ার্ড",
          "Current Password": "বর্তমান পাসওয়ার্ড",
          "Are you sure , that you want to logout?":
              "আপনি কি নিশ্চিত, আপনি লগআউট করতে চান?",
          "Available Points": "উপলব্ধ পয়েন্ট",
          "History": "ইতিহাস",
          "Notification": "বিজ্ঞপ্তি",
          "Your order had been ship": "আপনার অর্ডার চালান হয়েছে",
          "Fuel to Go": "জ্বালানি নিন",
          "Four Wheeler": "চার চাকা",
          "Vehicles Registration Number": "যানবাহন নিবন্ধন নম্বর"
        }
      };
}

// import 'package:test_prj/language/language_global_var.dart';
//
// class BnLanguage {
// //create hashmap for bangla language
//   Map<String, String> bnLanguage = {
//     LanguageGlobalVar.HELLO_WORLD: 'হ্যালো বিশ্ব',
//     LanguageGlobalVar.Choose_Language: 'ভাষা নির্বাচন করুন',
// //add other entries like this here
//   };
// }
