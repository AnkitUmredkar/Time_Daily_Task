<h1 align="center"> 🔶🔸 5.1 Flutter Buttons 🔸🔶 </h1>

<div align = "center">
  <img height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/43e38131-770e-41fe-a6d0-980c3e945d15"/>
</div>

<div align = "center">
<a  href="https://github.com/AnkitUmredkar/Time_Daily_Task/blob/master/lib/Timer_Daily_Task/flutter_button.dart">-> 📂 Go To Dart File 📂<-</a>
</div>

###

<h1 align="left"> </h1>

###

<h1 align="center"> 🔶🔸 5.2 Asynchronous Programming 🔸🔶 </h1>

# What is  Asynchronous Programming?

Asynchronous programming is a programming paradigm that allows tasks or operations to run independently and concurrently, without waiting for each other to complete before moving on to the next task. 

# What is Future Class ?

In Dart, a Future represents a value that may not be available yet. It encapsulates an asynchronous operation and provides a way to handle the result or error when it becomes available.  

# What is Duration class & Future.delayed() constructor with Example ?

## Duration Calss
The Duration class represents a span of time. It allows you to specify time durations in terms of hours, minutes, seconds, and milliseconds.    

### Example
```javascript
import 'dart:async';
import 'dart:io';

void main(){
  Timer(
    Duration(seconds: 3),
    (){
      print("Hello Dart");
    }
  );
}
```

## Future.delayed()
Future.delayed() is a method in Dart that creates a future representing a delayed computation. It allows you to schedule a task to be executed after a specified duration of time has passed.  

### Example
```javascript
import 'dart:async';
import 'dart:io';

void main(){
  Future.delayed(
    Duration(seconds: 3),
    (){
      print("Hello Dart");
    }
  );
}
```

# What is the Use of the async & await keyword?

In Flutter, async and await are used to perform asynchronous operations in a more readable and structured manner. They are part of the Dart language, on which Flutter is built.

## async keyword

The async keyword is used to mark a function as asynchronous.

## async keyword

The await keyword is used to pause the execution of an asynchronous function until a particular asynchronous operation is completed.

# What is Recursion ? With Example.

When function call itself it's called recursion

### Example
```javascript
import 'dart:async';
import 'dart:io';

void main(){
  Timer.periodic(Duration(seconds: 3), (timer) {
    print("Hello Dart");
   });
}
```

# What is Timer class with example ?

The Timer class is used to create a one-time or periodic timer. It allows you to schedule a callback function to be executed after a specified duration.

### Example
```javascript
import 'dart:async';
import 'dart:io';

void main(){
  Timer(Duration(seconds: 5), () {
    print("Hello Ankit");
  });
}
```

# What is Timer.periodic and use with Example?

Timer.periodic is a constructor in the Timer class in Dart that creates a periodic timer. It repeatedly calls a callback function at a specified interval until canceled.

### Example
```javascript
import 'dart:async';
import 'dart:io';

void main(){
  Timer.periodic(Duration(seconds: 3), (timer) {
    print("Hello Dart");
   });
}
```

###

<h1 align="left"> </h1>

###

<h1 align="center"> 🔶🔸 5.3 Digital Clock App Page 🔸🔶 </h1>

<div align = "center">
  <img align = "left" height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/4ea722e4-1fce-452d-bc8f-672522b27c9f"/>
  <video height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/2c31971c-afa2-46c8-9552-67b33daa8e46"/>
</div>

<div align = "center">
<a  href="https://github.com/AnkitUmredkar/Time_Daily_Task/blob/master/lib/Timer_Daily_Task/digital_clock_app.dart">-> 📂 Go To Dart File 📂<-</a>
</div>

###

<h1 align="left"> </h1>

###

<div align = "center">
  <video height="550" src=""/>

</div>

<h1 align="center"> 🔶🔸 5.4 Analogue Clock 🔸🔶 </h1>

<div align = "center">
  <img align = "left" height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/e87b7570-18d3-4f26-bf4d-fdad0fcd2e24"/>
  <video height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/3bca9ba4-e1ee-404e-ab82-e91e9d3c29bb"/>
</div>


<div align = "center">
<a  href="https://github.com/AnkitUmredkar/Time_Daily_Task/blob/master/lib/Timer_Daily_Task/analog_clock_app.dart">-> 📂 Go To Dart File 📂<-</a>
</div>
  
###

<h1 align="left"> </h1>

###

<h1 align="center"> 🔶🔸 Strap Watch 🔸🔶 </h1>

<div align = "center">
  <img align = "left" height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/0139a114-dd53-4f74-94d3-f8bea7409b4b"/>
  <video height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/0bcfed8c-c69e-4fe6-a9ba-38a0205bc7aa"/>
</div>


<div align = "center">
<a  href="https://github.com/AnkitUmredkar/Time_Daily_Task/blob/master/lib/Timer_Daily_Task/strapwatch.dart">-> 📂 Go To Dart File 📂<-</a>
</div>

###

<h1 align="left"> </h1>

###

<h1 align="center"> 🔶🔸 Timer App 🔸🔶 </h1>

<div align = "center">
  <img align = "left" height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/3178c2a8-d99d-45b1-a2a2-027bb0ce1775"/>
  <img height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/2c7b9a6a-71a4-46c3-845e-bfbee3df5185"/>
  <img align = "right" height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/ee273a92-e542-4df3-bdb4-4089c42e27d5"/>
</div>

<div align = "center">
<a href="https://github.com/AnkitUmredkar/Time_Daily_Task/tree/master/lib/Timer%20App">-> 📂 Go To Dart File 📂<-</a>

<div align = "center">
  <video height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/52edb2df-4433-434b-9326-962d8b3d31aa"/>
</div>


###

<h1 align="left"> </h1>

###


<h1 align="center"> 🔶🔸 Practice 🔸🔶 </h1>

<div align = "center">
  <img align = "left" height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/60e5bf9e-d206-4c1d-bd10-57f79197f28d"/>
  <img height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/aeaa3b69-7a6a-4deb-ac1a-0d4fcb1d451e"/>
  <img align = "right" height="550" src="https://github.com/AnkitUmredkar/Time_Daily_Task/assets/149374001/b3ae7117-adb8-4714-80e8-b6410d434e8c"/>
</div>

###

<div align = "center">
<a align="left" href="https://github.com/AnkitUmredkar/Time_Daily_Task/blob/master/lib/Practice/slider.dart">-> 📂 Go To Dart File 📂<-</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://github.com/AnkitUmredkar/Time_Daily_Task/blob/master/lib/Practice/range_slider.dart">-> 📂 Go To Dart File 📂 <-</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a align="right" href="https://github.com/AnkitUmredkar/Time_Daily_Task/blob/master/lib/Practice/dropdown_button.dart">-> 📂 Go To Dart File 📂 <-</a>
</div>

###

<h1 align="left"> </h1>

###
