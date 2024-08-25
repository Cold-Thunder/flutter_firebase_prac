import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuthInput extends StatefulWidget {
  TextEditingController numCont = TextEditingController();
  Country country;
  PhoneAuthInput({
    required this.numCont,
    required this.country
  });
  _PhoneAuthInputState createState() => _PhoneAuthInputState();
}

class _PhoneAuthInputState extends State<PhoneAuthInput> {

  @override
  Widget build(BuildContext context) {

    return TextField(
        controller: widget.numCont,
        keyboardType: TextInputType.number,
        style:const TextStyle(
          fontSize: 22,
          color: Colors.blue
        ),
        decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle: const TextStyle(fontSize: 22, color: Colors.blue),
            hintText: 'Enter your number...',
            hintStyle: const TextStyle(fontSize: 22, color: Colors.black26),
            prefixIcon: Container(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            setState((){
                              widget.country = value;
                            });
                          },
                          countryListTheme:
                              const CountryListThemeData(bottomSheetHeight: 500));
                    },
                    child: Text('${widget.country.flagEmoji} + ${widget.country.phoneCode}',
                        style: const TextStyle(fontSize: 22, color: Colors.blue)))),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.circular(10))));
  }
}
