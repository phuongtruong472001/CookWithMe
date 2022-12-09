import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/add_post_controller.dart';

final List<DropdownMenuItem<String>> menuItems = const [
  DropdownMenuItem(value: "Khai_vi", child: Text("Khai vi")),
  DropdownMenuItem(value: "Mon_chinh", child: Text("Mon chinh")),
  DropdownMenuItem(value: "Trang_mieng", child: Text("Trang mieng")),
  DropdownMenuItem(value: "An_vat", child: Text("An vat")),
];

class AddPostPage extends GetView<AddPostController> {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBCD6BE),
        title: const Text("Add Post"),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFBCD6BE),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          GestureDetector(
            child: Container(
              height: 200,
              color: Colors.white,
              child: Center(child: Image.asset("assets/images/ic_add_img.png")),
            ),
            onTap: () {
              
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(children: [
              DropdownButton(
                value: "Khai_vi",
                items: menuItems,
                onChanged: (value) {
                  print("select");
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Name",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  maxLines: 5,
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Ingredients",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Step 1",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child:
                    Center(child: Image.asset("assets/images/ic_add_img.png")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Link video",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xFF588A67),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Add item",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFA6163),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    ]),
              )
            ]),
          )
        ]),
      )),
    );
  }
}
