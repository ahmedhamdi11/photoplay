import 'package:flutter/material.dart';
import 'package:photoplay/Features/profile/presentation/widgets/custom_dropdown_menu.dart';
import 'package:photoplay/Features/profile/presentation/widgets/language_btn.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  List languagesList = ['English', 'Arabic'];
  String selectedLanguage = 'English';
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Text('Language: $selectedLanguage'),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: isExpanded
                        ? const Icon(Icons.arrow_drop_up)
                        : const Icon(Icons.arrow_drop_down)),
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),

          // my custom Dropdown Menu
          CustomDropdownMenu(
            expand: isExpanded,
            children: [
              //the English button
              LanguageButton(
                btnText: languagesList[0],
                onTap: () {
                  setState(() {
                    selectedLanguage = languagesList[0];
                    isExpanded = false;
                  });
                },
              ),

              //my divider
              const Divider(
                endIndent: 8.0,
                indent: 8.0,
              ),

              // the Arabic button
              LanguageButton(
                btnText: languagesList[1],
                onTap: () {
                  showCustomSnackBar(
                    context: context,
                    content: 'Arabic Will be available soon !',
                    backgroundColor: kPrimatyColor,
                    textColor: Colors.black,
                  );
                  setState(() {
                    isExpanded = false;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
