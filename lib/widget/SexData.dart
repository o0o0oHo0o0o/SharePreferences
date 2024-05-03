import 'package:flutter/material.dart';

class SexData extends StatelessWidget {
  final List<String> sexs;
  final ValueChanged<String> onSelectedSex;

  const SexData({
    required this.sexs,
    required this.onSelectedSex,
  });

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).unselectedWidgetColor;
    final sexs = ['Male', 'Female', 'Other'];

    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: background,
        ),
        child: ToggleButtons(
          isSelected: sexs.map((selectedSex) => this.sexs.contains(selectedSex)).toList(),          selectedColor: Colors.white,
          color: Colors.pinkAccent,
          fillColor: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          renderBorder: false,
          children: sexs.map(buildSex).toList(),
          onPressed: (index) => onSelectedSex(sexs[index]),
        )
      ),
    );
    throw UnimplementedError();
  }
  Widget buildSex(String text){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(text),
    );
  }
}
