// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TaskHolder extends StatelessWidget {
  const TaskHolder({
    super.key,
    required this.title,
    required this.content,
    this.ontap,
    this.ontap_,
    required this.isSelected,
    this.selectedColor,
    this.unselectedColor,
  });

  final String title;
  final String content;
  final Function()? ontap;
  final Function()? ontap_;
  final bool isSelected;
  final Color? selectedColor;
  final Color? unselectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.primary),
      child: Row(
        children: [
          // Content of the task
          GestureDetector(
            onTap: ontap,
            child: Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 290,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   content,
                          //   textAlign: TextAlign.start,
                          //   style: const TextStyle(
                          //       height: 1,
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.w100),
                          // ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),

          // The checkbox
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: ontap_,
                child: const SizedBox(
                    height: 120,
                    // decoration: BoxDecoration(
                    //     color: Theme.of(context).colorScheme.tertiary,
                    //     borderRadius: const BorderRadius.only(
                    //         bottomRight: Radius.circular(20),
                    //         topRight: Radius.circular(20))),
                    child: Icon(
                      color: Colors.black38,
                      Icons.delete,
                      size: 30,
                    )),
              )),
        ],
      ),
    );
  }
}
