import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/custom_textformfield.dart';
import '../../shared/constants/dimensions.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var consultationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'إتصل بنا',
          style: TextStyle(
            fontSize: Dimensions.font20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Dimensions.screenHeight,
            width: double.maxFinite,
            color: Colors.green,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height30,
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                  ),
                  height: Dimensions.height30 * 4,
                  color: Colors.green,
                  child: Text(
                    '. سيكون موضع تقدير أي ملاحظات أو اقتراح',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font20,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: Dimensions.screenHeight,
                    width: Dimensions.screenWidth,
                    padding: EdgeInsets.only(
                        top: Dimensions.height30, left: Dimensions.width30, right: Dimensions.width30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius30 * 1.5),
                        topLeft: Radius.circular(Dimensions.radius30 * 1.5),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: Dimensions.width20,
                              top: Dimensions.height15,
                            ),
                            child: Text(
                              'ملاحظات',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font26,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: Dimensions.height45,
                          ),

                          // TextFormField of Name
                          Padding(
                            padding: EdgeInsets.only(right: Dimensions.width10),
                            child: defaultTextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              label: 'الإسم',
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'برجاء إدخال الإسم';
                                }
                                return null;
                              },
                              prefix: Icons.person,
                              prefixColor: Colors.green,
                            ),
                          ),

                          SizedBox(
                            height: Dimensions.height20,
                          ),

                          // TextFormField of Email Address
                          Padding(
                            padding: EdgeInsets.only(right: Dimensions.width10),
                            child: defaultTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              label: 'الإيميل',
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'برجاء كتابة الإيميل';
                                }
                                if (!RegExp(
                                        "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return 'برجاء ادخال ايميل صحيح';
                                }
                                return null;
                              },
                              prefix: Icons.email_outlined,
                              prefixColor: Colors.green,
                            ),
                          ),

                          SizedBox(
                            height: Dimensions.height20,
                          ),

                          // Message TextField
                          Container(
                            width: double.maxFinite, //height: 350,
                            padding: EdgeInsets.only(right: Dimensions.width10),
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: consultationController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'برجاء كتابة ملاحظاتك';
                                }
                                return null;
                              },
                              maxLines: 5,

                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                hintText: 'ملاحظات',
                                suffix: Icon(Icons.notes, color: Colors.green,),
                                hintStyle: TextStyle(fontSize: Dimensions.font20),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: Dimensions.height20,
                                  horizontal: Dimensions.height15,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: Dimensions.height45,
                          ),

                          // Send Button
                          Padding(
                            padding: EdgeInsets.only(right: Dimensions.width45*3, left: Dimensions.width45*2),
                            child: defaultButton(
                              onPressed: (){
                            if (formKey.currentState!.validate())
                            {
                              Get.snackbar('ملاحظات', 'تم ارسال الملاحظات بنجاح', backgroundColor: Color(0xFF89dad0), colorText: Colors.white,);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLayout()));
                            }else{
                              Get.snackbar('ملاحظات', '!!! لم يتم ارسال الملاحظات', backgroundColor: Colors.red, colorText: Colors.white,);
                            }
                            },
                              text: 'إرسال',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget defaultButton({
    required VoidCallback onPressed,
    required String text,
    Color? backgroundColor,
  }) =>
      Container(
        height: Dimensions.height30 + Dimensions.height20,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius5),
          color: Colors.green,
        ),
        child: MaterialButton(
          color: backgroundColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.font20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );

}
