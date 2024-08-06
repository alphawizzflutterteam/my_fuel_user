import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class English extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "User Name": "User Name",
          "Enter your Mobile Number ": "Enter your Mobile Number",
          "Login with your id": "Login with your id",
          "Confirm Password": "Confirm Password",
          "Create Password": "Create Password",
          "Forgot Password": "Forgot Password",
          "Enter your Email": "Enter your Email",
          "We Have sent the 4 digit Verification code":
              "We Have sent the 4 digit Verification code",
          "Resend OTP": "Resend OTP",
          "Verify": "Verify",
          "Didn't received Otp?": "Didn't received Otp?",
          "Please Sign in to your account": "Please Sign in to your account",
          "Next": "Next",
          "Personal": "Personal",
          "Business": "Business",
          "Reset it": "Reset it",
          "Don't Have an account?": "Don't Have an account?",
          "Phone No. Or Email'": "Phone No. Or Email",
          "Please enter Phone No. Or Email": "Please enter Phone No. Or Email",
          "Sign Up": "Sign Up",
          "Please Enter Password": "Please Enter Password",
          "Password": "Password",
          "Login": "Login",
          "Enter verification code": "Enter verification code",
          "Enter the OTP sent to": "Enter the OTP sent to",
          "Don't received OTP? ": "Don't received OTP? ",
          "Your My Fuels Card is Ready": "Your My Fuels Card is Ready",
          "Congratulations": "Congratulations'",
          "Every Drop Matters": "Every Drop Matters",
          "Member Since": "Member Since",
          "Card added to your profile": "Card added to your profile",
          "Full Name": "Full Name",
          "Gst Number": "Gst Number",
          "Price": "Price",
          "Filter": "Filter",
          "Minimum": "Minimum",
          "Maximum": "Maximum",
          "Apply": "Apply",
          "Cancel": "Cancel",
          "Rating": "Rating",
          "Above": "Above",
          "Full Service": "Full Service",
          "Car Service": "Car Service",
          "Engine Oil": "Engine Oil",
          "Periodic Service": "Periodic Service",
          "Others": "Others",
          "Schedule Car Service": "Schedule Car Service",
          "Schedule data and timing": "Schedule data and timing",
          "Slots": "Slots",
          "Book Now": "Book Now",
          "Car Wash": "Car Wash",
          "Search": "Search",
          "Star Car Wash": "Star Car Wash",
          " ring Road": " ring Road",
          "to": "to",
          "Checkout": "Checkout",
          "Delivery Address": "Delivery Address",
          "Home": "Home",
          "Change or add new address": "Change or add new address",
          "Car & tyres detail": "Car & tyres detail",
          "Vehicle Manufacture": "Vehicle Manufacture",
          "Model": "Model",
          "Booking Date": "Booking Date",
          "Tyres": "Tyres",
          "Monday": "Monday",
          "August": "August",
          "Price Detail": "Price Detail",
          "Tyres Price": "Tyres Price",
          "Service": "Service",
          "Total Amount": "Total Amount",
          "Scheduled Date and Time": "Scheduled Date and Time",
          "Delivery free": "Delivery free",
          "Discount": "Discount",
          "Need to Update Pricing": "Need to Update Pricing",
          "Schedule date and timing": "Schedule date and timing",
          "My Fuels Price": "My Fuels Price",
          "Diesel": "Diesel",
          "Vendor Name": "Vendor Name",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
          "Fuel On Tap Detail": "Fuel On Tap Detail",
          "MRP": "MRP",
          "Add Fuel Quantity": "Add Fuel Quantity",
          "Add Quantity": "Add Quantity",
          "Assets": "Assets",
          "Add Details": "Add Details",
          "Asset Name": "Asset Name",
          "Asset Capacity": "Asset Capacity",
          "Fuel capacity": "Fuel capacity",
          "Add Asset type": "Add Asset type",
          "Genset Maintenance": "Genset Maintenance",
          "Engine oil filter": "Engine oil filter",
          "Preodic Service": "Preodic Service",
          "RSP": "RSP",
          "Delivery Fee": "Delivery Fee",
          "GST(On Delivery Fee)": "GST(On Delivery Fee)",
          "Other Charges": "Other Charges",
          "Insurance": "Insurance",
          "Vehicle No.": "Vehicle No.",
          "Email": "Email",
          "Mobile No.": "Mobile No.",
          "Submit": "Submit",
          "On of our agents will connect": "On of our agents will connect",
          "you shortly": "you shortly",
          "Back to home": "Back to home",
          "Rescue Me": "Rescue Me",
          "Select Vehicle": "Select Vehicle",
          "Select Services": "Select Services",
          "Fuel Type": "Fuel Type",
          "Fuel Quantity": "Fuel Quantity",
          "Done": "Done",
          "Tyres Listing": "Tyres Listing",
          "Perfinza CLX1": "Perfinza CLX1",
          "Schedule Day": "Schedule Day",
          "Door Step ": "Door Step ",
          "Select Date & Slot": "Select Date & Slot",
          "Schedule date": "Schedule date",
          "Note to service provider": "Note to service provider",
          "Continue": "Continue",
          "Cancel Order Reason": "Cancel Order Reason",
          "Select Car Type": "Select Car Type",
          "Select your vehicle type": "Select your vehicle type",
          "Bottam sheet": "Bottam sheet",
          "Lorem lpush is simply dumm": "Lorem lpush is simply dumm",
          "Order ID": "Order ID",
          "Sold by:Seller": "Sold by:Seller",
          "Time": "Time",
          "Date": "Date",
          "Delivery Required an OTP": "Delivery Required an OTP",
          "Share the otp to delivery boy ": "Share the otp to delivery boy ",
          "Alert Dialog": "Alert Dialog",
          "Close": "Close",
          "Write Review": "Write Review",
          "Address": "Address",
          "Phone": "Phone",
          "Review": "Review",
          "Description": "Description",
          "Write here": "Write here",
          "Charging Station": "Charging Station",
          "Order Fuel": "Order Fuel",
          "Door Step Delivery": "Door Step Delivery",
          "Products & Services": "Products & Services",
          "Enter Your Vehicle Number": "Enter Your Vehicle Number",
          "Vehicle Number": "Vehicle Number",
          "Select a Tyres For your Vehicle": "Select a Tyres For your Vehicle",
          "Select Vehicle Manufacture Type": "Select Vehicle Manufacture Type",
          "Select Model": "Select Model",
          "Tyre Size": "Tyre Size",
          "lorem lpsum is simply dummy text of the printing and typesetting industry":
              "lorem lpsum is simply dummy text of the printing and typesetting industry",
          "Fuel Management Services": "Fuel Management Services",
          "Monthly Consumption": "Monthly Consumption",
          "Number of assets": "Number of assets",
          "Number of Locations": "Number of Locations",
          "My Fuels Product": "My Fuels Product",
          "Order Now": "Order Now",
          "Vendor Details": "Vendor Details",
          "Speed Petrol": "Speed Petrol",
          "Schedule Time": "Schedule Time",
          "Shopping address": "Shopping address",
          "Track Order": "Track Order",
          "Ordered Saturday": "Ordered Saturday",
          "Delivered": "Delivered",
          "Service Charges": "Service Charges",
          "DISCOUNT": "DISCOUNT",
          "Best Offers": "Best Offers",
          "Offer": "Offer",
          "Expires": "Expires",
          "Order Detail": "Order Detail",
          "Out for delivery": "Out for delivery",
          "Pickup & Delivery Address": "Pickup & Delivery Address",
          "Settings": "Settings",
          "My Fuels Card": "My Fuels Card",
          "My Location": "My Location",
          "Change Language": "Change Language",
          "Contact Us": "Contact Us",
          "Change Password": "Change Password",
          "Privacy Policy": "Privacy Policy",
          "Terms and Conditions": "Terms and Conditions",
          "Logout": "Logout",
          "Select Type": "Select Type",
          "Select Address": "Select Address",
          "Use My Location": "Use My Location",
          "Select Delivery type": "Select Delivery type",
          "Name": "Name",
          "Enter your name": "Enter your name",
          "Mobile Number": "Mobile Number",
          "Alternate Mobile number": "Alternate Mobile number",
          "Enter your Alternate Mobile number":
              "Enter your Alternate Mobile number",
          "Home address": "Home address",
          "Road name,Area": "Road name,Area",
          "Enter your Road name ,area colony":
              "Enter your Road name ,area colony",
          "Shipping Address": "Shipping Address",
          "New Address": "New Address",
          "Billing Address": "Billing Address",
          "Same as Shipping address": "Same as Shipping address",
          "House no., Building Name": "House no., Building Name",
          "Enter your Home no.. Building Name":
              "Enter your Home no.. Building Name",
          "Country": "Country",
          "Enter your country name": "Enter your country name",
          "State": "State",
          "Enter your State name": "Enter your State name",
          "City": "City",
          "Enter your city name": "Enter your city name",
          "Pincode": "Pincode",
          "Enter your Pincode": "Enter your Pincode",
          "Save Address": "Save Address",
          "Car": "Car",
          "Pick Up": "Pick Up",
          "Open Bottom Sheet": "Open Bottom Sheet",
          "Download Invoice": "Download Invoice",
          "About": "About",
          "Wade Warren": "Wade Warren",
          "Book Service Now": "Book Service Now",
          "Completed": "Completed",
          "Schedule": "Schedule",
          "Fuels": "Fuels",
          "Rescue fuel": "Rescue fuel",
          "On the way": "On the way",
          "Fuel to go": "Fuel to go",
          "Order Cancelled": "Order Cancelled",
          "CNG": "CNG",
          "Order Saturday": "Order Saturday",
          "Saturday": "Saturday",
          "Cancel Order": "Cancel Order",
          "Order Placed Successfully": "Order Placed Successfully",
          "Points added to your": "Points added to your",
          "Rate Driver": "Rate Driver",
          "Submit Review": "Submit Review",
          "Payment": "Payment",
          "Card Number": "Card Number",
          "Expiry Date": "Expiry Date",
          "CVV": "CVV",
          "Pay Now": "Pay Now",
          "Payment Type": "Payment Type",
          "Select payment method": "Select payment method",
          "Visa": "Visa",
          "Phone Pay": "Phone Pay",
          "UPI Payment": "UPI Payment",
          "Google Pay": "Google Pay",
          "Pay by My fuels card": "Pay by My fuels card",
          "Available balance": "Available balance",
          "Add Money": "Add Money",
          "PhonePe": "PhonePe",
          "Pay at Station": "Pay at Station",
          "Buy now pay later": "Buy now pay later",
          "Road name, Area Colony": "Road name, Area Colony",
          "New Password": "New Password",
          "Current Password": "Current Password",
          "Are you sure , that you want to logout?":
              "Are you sure , that you want to logout?",
          "Available Points": "Available Points",
          "History": "History",
          "Notification": "Notification",
          "Your order had been ship": "Your order had been ship",
          "Fuel to Go": "Fuel to Go",
          "Four Wheeler": "Four Wheeler",
          "Vehicles Registration Number": "Vehicles Registration Number",
          "Profile": "Profile",
          "Offers": "Offers",
          "My Orders": "My Orders",
          "No History Found": "No History Found",

          /// Here To  setLanguage
          "Fuel Quantity(Min 5 ltrs - Max 20 ltrs":
              "Fuel Quantity(Min 5 ltrs - Max 20 ltrs",
          "Add Address": "Add Address",
          "My Assets": "My Assets",
          "Asset Capacity/Power": "Asset Capacity/Power",
          "Edit Assets": "Edit Assets",
          "Are you Sure you want to": "Are you Sure you want to",
          "delete": "delete",
          "Asset Name (eg: genset1)": "Asset Name (eg: genset1)",
          "Asset Capacity/Power (eg: 120kva)":
              "Asset Capacity/Power (eg: 120kva)",
          "Fuel capacity(eg: 200 litres)": "Fuel capacity(eg: 200 litres)",
          "Fuel Consumption": "Fuel Consumption",
          "Office": "Office",
          "Other": "Other",

          "Phone No. Or Email": "Phone No. Or Email",
          "Password": "Password",
          "Forgot Password": "Forgot Password",
          "Reset It": "Reset It",
          "Membership No": "Membership No",
          "Don't Have an account?": "Don't Have an account?",
          "Emergency": "Emergency",
          "Car Service": "Car Service",
          "Insurance": "Insurance",
          "Tyres": "Tyres",
          "Battery": "Battery",
          "Car Wash": "Car Wash",
          "My Order": "My Order",
          "Search": "Search",
          "Discount Offer": "Discount Offer",
          "Offer": "Offer",
          "Expires": "Expires",
          "10 percentage": "10 percentage",
          "10 percentage for code DISCOUNT55":
              "10 percentage for code DISCOUNT55",
          "My Assets": "My Assets",
          "FAQS": "FAQS",
          "My fuels Card": "My fuels Card",
          "Add Assets": "Add Assets",
          "Contact Us": "Contact Us",
          "Change Password": "Change Password",
          "Current Password": "Current Password",
          "New Password": "New Password",
          "Confirm Password": "Confirm Password",
          "Privacy Policy": "Privacy Policy",
          "Privacy Policy": "Privacy Policy",
          "Terms & Conditions": "Terms & Conditions",
          "Logout": "Logout",
          "Cancel": "Cancel",
          "Fuels": "Fuels",
          "Car Wash": "Car Wash",
          "Rescue fuel": "Rescue fuel",
          "Tyres": "Tyres",
          "Battery": "Battery",
          "Insurance": "Insurance",
          "Ganset Maintenance": "Ganset Maintenance",
          "Fuel Management": "Fuel Management",
          "Fuel on Tap": "Fuel on Tap",
          "My Fuels Jerry Can": "My Fuels Jerry Can",
          "Engine Oil and Filter": "Engine Oil and Filter",
          "Periodic Service": "Periodic Service",
          "Full Service": "Full Service",
          "Others": "Others",
          "Select Address": "Select Address",
          "New Address": "New Address",
          "Billing Address": "Billing Address",
          "Delivery Address": "Delivery Address",
          "See more": "See more",
          "Office": "Office",
          "Home": "Home",
          "Price Detail": "Price Detail",
          "MRP(1 item)": "MRP(1 item)",
          "Alternate Mobile Number": "Alternate Mobile Number",
          "Pincode": "Pincode",
          "Delivery free": "Delivery free",
          "Checkout": "Checkout",
          "Discount": "Discount",
          "Fuel Consumption": "Fuel Consumption",
          "Total Amount": "Total Amount",
          "Checkout": "Checkout",
          "Razorpay": "Razorpay",
          "Next": "Next",
          "Already Have an account?": "Already Have an account?",
          "Sign Up": "Sign Up",
          "Sign in": "Sign in",
          "Email": "Email",
          "Phone No": "Phone No",
          "Gst Number(optional)": "Gst Number(optional)",
          "Full Name": "Full Name",
          "Select Vehicle": "Select Vehicle",
          "Please Select Vehicle Type": "Please Select Vehicle Type",
          "Fuel On Tab": "Fuel On Tab",
          "Please enter name": "Please enter name",
          "Order Placed Succussfully": "Order Placed Succussfully",
          "Pay by My fuels card": "Pay by My fuels card",
          "Payment type": "Payment type",
          "Add Money": "Add Money",
          "Fuel Quantity": "Fuel Quantity",
          "Pay at Station/Home": "Pay at Station/Home",
          "Save Address & Next": "Save Address & Next",
          "Are you sure,that you want to logout?":
              "Are you sure,that you want to logout?",

          "Select Vehicle": "Select Vehicle",
          "Select Vehicle Model": "Select Vehicle Model",
          "Select a Tyres For your Vehicle": "Select a Tyres For your Vehicle",
          "Select a Battery For your Vehicle":
              "Select a Battery For your Vehicle",
          "Vehicle Number": "Select Number",
          "Submit": "Submit",
          "Slots": "Slots",
          "Tyres": "Tyres",
          "Outlet": "Outlet",
          "Note to service provider": "Note to service provider",
          "Schedule date": "Schedule date",
          "Select Date & Slot": "Select Date & Slot",
          "Door Step": "Door Step",
          "Continue": "Continue",
          "Tyre Size": "Tyre Size",
          "Book Now": "Book Now",
          "Car Service": "Car Service",
          "Schedule Car Service": "Schedule Car Service",
          "Schedule data and timing": "Schedule data and timing",
          "Schedule date and timing": "Schedule date and timing",
          "On of our agents will connect": "On of our agents will connect",
          "you shortly": "you shortly",
          "Schedule Day": "Schedule Day",
          "Back to home": "Back to home",
          "Battery Listing": "Battery Listing",
          "Select Car Type": "Select Car Type",
          "Select Car Wash": "Select Car Wash",
          "Self Service": "Select Service",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
          "No Address Found": "No Address Found",
          "Edit Profile": "Edit Profile",
          "Update Profile": "Update Profile"
        }
      };
}

// import 'package:test_prj/language/language_global_var.dart';
//
// class EnLanguage {
// //create hashmap for english language
//   Map<String, String> enLanguage = {
//     LanguageGlobalVar.HELLO_WORLD: 'Hello World',
//     LanguageGlobalVar.Choose_Language: 'Choose Language',
// //add other entries like this here
//   };
// }
