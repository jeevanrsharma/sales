import 'package:flutter/material.dart';

class GenerateBill extends StatefulWidget {
  const GenerateBill({Key? key}) : super(key: key);

  @override
  State<GenerateBill> createState() => _GenerateBillState();
}

class _GenerateBillState extends State<GenerateBill> {
  final productNameCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else {
                          return null;
                        }
                      },
                      controller: productNameCtr,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        prefixIcon: Icon(Icons.verified_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    myButton(context),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  OutlinedButton myButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //   formData.productName = productNameCtr.text;
        //   // formData.isTopProduct = listCheckVal;
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     return formDetails(formData: formData);
        //   }));
        // }
      },
      child: Text('Form submission'),
    );
  }
}
