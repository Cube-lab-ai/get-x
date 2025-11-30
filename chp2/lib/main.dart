// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:getx_state_management/routes/page_routes.dart';
// import 'package:getx_state_management/routes/routes.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       getPages: PageRoutes.routes,
//       initialRoute: Routes.product, // This loads ProductView()
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Scaffold(body: ProductPage()));
//   }
// }

// class ProductPage extends StatefulWidget {
//   const ProductPage({super.key});

//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MyTextField(
//         ontap: (value) {
//           print(value);
//           return value;
//         },
//       ),
//     );
//   }
// }

// class MyTextField extends StatefulWidget {
//   final Function(String) ontap;
//   const MyTextField({super.key, required this.ontap});

//   @override
//   State<MyTextField> createState() => _MyTextFieldState();
// }

// class _MyTextFieldState extends State<MyTextField> {
//   final TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: (value) {
//         // final result = widget.ontap;

//         // Here’s what’s going wrong:
//         // widget.ontap is a function,
//         // widget.ontap not the result of calling the function.
//         // When you assign it to result without parentheses (), result just points to the function itself.
//         // That’s why print(result) prints something like Closure: (String) => String instead of the actual value.
//         // To get the actual value, you must call the function and pass the value from onChanged:

//         final result = widget.ontap(value);
//         print(result);
//       },
//     );
//   }
// }

// ------------------------------------------------------------

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ProductPage()));
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyTextField(
        ontap: (value) {
          print(value);
          return value;
        },
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  final Function(String) ontap;
  const MyTextField({super.key, required this.ontap});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TextFormField’s onChanged property expects a function with this signature:
    return TextFormField(onChanged: widget.ontap);

    // void Function(String value)
    // Your widget.ontap also has the same signature:
    // final Function(String) ontap;
    // So when you pass it directly:
    // onChanged: widget.ontap
    // …it works because the signatures match exactly. Flutter will call ontap(value) internally whenever the text changes, passing the value automatically.

    // onChanged: widget.ontap
    // Is exactly equivalent to:
    // onChanged: (value) {
    //   widget.ontap(value);
    // }

    // The (value) { ... } wrapper is implicit here. That’s why it works without you explicitly calling widget.ontap(value) inside a lambda.
  }
}
