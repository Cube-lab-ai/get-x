// ------------------ HOME PAGE ------------------
// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_basics/counter_controller.dart';

class HomePage extends StatelessWidget {
  // 🧩 4. Dependency Injection (DI)

  // You create an instance of CounterController().
  // You “inject” it into GetX’s dependency system using Get.put().
  // GetX stores the controller so it can be reused anywhere in the app.
  // Later, you can retrieve it with:
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(child: Obx(() => Text(controller.count.string))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: controller.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => Get.to(() => SecondPage()),
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

// ------------------ SECOND PAGE ------------------
class SecondPage extends StatelessWidget {
  final CounterController controller = Get.find();

  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Obx(
          () => Text(
            "Shared Count: ${controller.count}",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
