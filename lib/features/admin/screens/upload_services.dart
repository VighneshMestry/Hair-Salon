import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/features/home/provider/home_provider.dart';
import 'package:hair_salon/models/services_model.dart';
import 'package:hair_salon/utils/custom_button.dart';
import 'package:hair_salon/utils/custom_textfield.dart';
import 'package:hair_salon/utils/utils.dart';
import 'package:provider/provider.dart';

class UploadServices extends StatefulWidget {
  const UploadServices({super.key});

  @override
  State<UploadServices> createState() => _UploadServicesState();
}

class _UploadServicesState extends State<UploadServices> {
  final _addProductFormKey = GlobalKey<FormState>();
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController originalPriceController = TextEditingController();
  final TextEditingController discountedPriceController =
      TextEditingController();
  List<File> serviceImage = [];
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    super.dispose();
    serviceNameController.dispose();
    originalPriceController.dispose();
    discountedPriceController.dispose();
  }

  void uploadServices(ServiceModel service) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    try {
      // Storing image to storage
      await homeProvider
          .storeImagetoStorage(
              "serviceImage/${service.serviceName}", serviceImage[0])
          .then((value) {
        service.imageUrl = value;
      });

      // Storing data to firebase
      await _firebaseFirestore
          .collection("Services")
          .add(service.toMap())
          .whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Service Added"),
              ),
            ),
          );
    } catch (e) {
      throw (e.toString());
    }
  }

  selectImages() async {
    var res = await pickImages();
    setState(() {
      serviceImage.removeRange(0, serviceImage.length - 1);
      serviceImage.add(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  // gradient: Gradient(colors:[ Colors.blueGrey]),
                  ),
            ),
            title: Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 3),
              child: const Text(
                'Add Service',
                style: TextStyle(color: Colors.black),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                serviceImage.isNotEmpty
                    ? GestureDetector(
                        onTap: selectImages,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              serviceImage[0],
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open_outlined,
                                  size: 40,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: serviceNameController,
                  hintText: 'Service Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: originalPriceController,
                  hintText: 'Original Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: discountedPriceController,
                  hintText: 'Discounted Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Add Service',
                  onTap: () {
                    ServiceModel serviceModel = ServiceModel(
                      serviceName: serviceNameController.text.trim(),
                      originalPrice: originalPriceController.text.trim(),
                      discountedPrice: discountedPriceController.text.trim(),
                      imageUrl: serviceImage.first.path,
                    );
                    uploadServices(serviceModel);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
