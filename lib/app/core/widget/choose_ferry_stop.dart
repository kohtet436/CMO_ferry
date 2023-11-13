import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/widget/ferry_app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../values/strings_manager.dart';

class ChooseFerryStop extends StatelessWidget {
  ChooseFerryStop({super.key});

  String value = "Yangon";

  final List<DropdownMenuItem<String>> townships = [
    const DropdownMenuItem(
      value: "Botataung",
      child: RegularText(
        text: "Botataung",
      ),
    ),
    const DropdownMenuItem(
      value: "Dawbon",
      child: RegularText(
        text: "Dawbon",
      ),
    ),
    const DropdownMenuItem(
      value: "East Dagon",
      child: RegularText(
        text: "East Dagon",
      ),
    ),
    const DropdownMenuItem(
      value: "Mingala Taungnyunt",
      child: RegularText(
        text: "Mingala Taungnyunt",
      ),
    ),
    const DropdownMenuItem(
      value: "North Dagon",
      child: RegularText(
        text: "North Dagon",
      ),
    ),
    const DropdownMenuItem(
      value: "North Okkalapa",
      child: RegularText(
        text: "North Okkalapa",
      ),
    ),
    const DropdownMenuItem(
      value: "Pazundaung",
      child: RegularText(
        text: "Pazundaung",
      ),
    ),
    const DropdownMenuItem(
      value: "South Dagon",
      child: RegularText(
        text: "South Dagon",
      ),
    ),
    const DropdownMenuItem(
      value: "South Okkalapa",
      child: RegularText(
        text: "South Okkalapa",
      ),
    ),
    const DropdownMenuItem(
      value: "Tamwe",
      child: RegularText(
        text: "Tamwe",
      ),
    ),
    const DropdownMenuItem(
      value: "Thaketa",
      child: RegularText(
        text: "Thaketa",
      ),
    ),
    const DropdownMenuItem(
      value: "Thingangyun",
      child: RegularText(
        text: "Thingangyun",
      ),
    ),
    const DropdownMenuItem(
      value: "Yankin",
      child: RegularText(
        text: "Yankin",
      ),
    ),
    const DropdownMenuItem(
      value: "Yangon",
      child: RegularText(
        text: "Yangon",
      ),
    ),
    const DropdownMenuItem(
      value: "Hlaingthaya",
      child: RegularText(
        text: "Hlaingthaya",
      ),
    ),
    const DropdownMenuItem(
      value: "Hlegu",
      child: RegularText(
        text: "Hlegu",
      ),
    ),
    const DropdownMenuItem(
      value: "Hmawbi",
      child: RegularText(
        text: "Hmawbi",
      ),
    ),
    const DropdownMenuItem(
      value: "Htantabin",
      child: RegularText(
        text: "Htantabin",
      ),
    ),
    const DropdownMenuItem(
      value: "Insein",
      child: RegularText(
        text: "Insein",
      ),
    ),
    const DropdownMenuItem(
      value: "Mingaladon",
      child: RegularText(
        text: "Mingaladon",
      ),
    ),
    const DropdownMenuItem(
      value: "Shwepyitha",
      child: RegularText(
        text: "Shwepyitha",
      ),
    ),
    const DropdownMenuItem(
      value: "Taikkyi",
      child: RegularText(
        text: "Taikkyi",
      ),
    ),
    const DropdownMenuItem(
      value: "Thanlyin",
      child: RegularText(
        text: "Thanlyin",
      ),
    ),
    const DropdownMenuItem(
      value: "Ahlon",
      child: RegularText(
        text: "Ahlon",
      ),
    ),
    const DropdownMenuItem(
      value: "Bahan",
      child: RegularText(
        text: "Bahan",
      ),
    ),
    const DropdownMenuItem(
      value: "Dagon",
      child: RegularText(
        text: "Dagon",
      ),
    ),
    const DropdownMenuItem(
      value: "Hlaing",
      child: RegularText(
        text: "Hlaing",
      ),
    ),
    const DropdownMenuItem(
      value: "Kamayut",
      child: RegularText(
        text: "Kamayut",
      ),
    ),
    const DropdownMenuItem(
      value: "Kyauktada",
      child: RegularText(
        text: "Kyauktada",
      ),
    ),
    const DropdownMenuItem(
      value: "Kyimyindaing",
      child: RegularText(
        text: "Kyimyindaing",
      ),
    ),
    const DropdownMenuItem(
      value: "Lanmadaw",
      child: RegularText(
        text: "Lanmadaw",
      ),
    ),
    const DropdownMenuItem(
      value: "Latha",
      child: RegularText(
        text: "Latha",
      ),
    ),
    const DropdownMenuItem(
      value: "Mayangon",
      child: RegularText(
        text: "Mayangon",
      ),
    ),
    const DropdownMenuItem(
      value: "Pabedan",
      child: RegularText(
        text: "Pabedan",
      ),
    ),
    const DropdownMenuItem(
      value: "Seikkan",
      child: RegularText(
        text: "Seikkan",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DropdownButton(
          items: townships,
          value: value,
          onChanged: (value) => _changeSelectedValue(value),
        ),
      ),
    );
  }

  void _changeSelectedValue(String? value) {
    this.value = value ?? "Yangon";
  }
}
