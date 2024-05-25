
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/res/colors/app_colors.dart';

class RoundButton extends StatefulWidget {
  const RoundButton({super.key,
  this.textColor= AppColors.blackColor,
  this.ButtonColor= AppColors.blackColor,
  required this.title,
  required this.onPress,
  this.width= 50,
  this.height=60,
  this.loading= false,

  });
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, ButtonColor;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.ButtonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: widget.loading ? Center(child: CircularProgressIndicator()) :
        Center(child: Text(widget.title.tr))
        ,
      ),
    );
  }
}