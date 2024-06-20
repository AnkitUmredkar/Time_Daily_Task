import 'package:flutter/material.dart';

TextEditingController txtName = TextEditingController();
TextEditingController txtProduct = TextEditingController();
TextEditingController txtPrice = TextEditingController();
List ctrlList = [];
int selectedIndex = 0;
GlobalKey<FormState> formKey = GlobalKey();
GlobalKey<FormState> imgKey = GlobalKey();
double startValue = 0,endValue = 1000;