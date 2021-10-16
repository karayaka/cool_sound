import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {

  Function onChange;
  double initRate;

  CustomSlider({
    Key? key,
    required this.onChange,
    required this.initRate,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {



  @override
  Widget build(BuildContext context) {
    return Slider(
      value: (widget.initRate),
      onChanged: (val){
        setState(() {
          widget.initRate=val;
          widget.onChange(val);
        });
      },
      min: 1,
      max: 100,
    );
  }
}
