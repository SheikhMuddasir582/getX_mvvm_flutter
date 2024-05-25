import 'package:flutter/material.dart';
import 'package:get/get.dart';
class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onpressed;
  const InternetExceptionWidget({super.key, required this.onpressed});

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: height * .15,),
          Icon(Icons.cloud_off),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(child: Text('internet exception'.tr, textAlign: TextAlign.center,)),
          ),
          SizedBox(height: height * .15,),
          InkWell(
            onTap: widget.onpressed,
            child: Container(
              height: 44,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text('retry', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),),
            ),
          )
        ],
      ),
    );
  }
}