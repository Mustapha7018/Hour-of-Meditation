import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hom_app/core/themes/hom_palette.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/widgets/search_field.dart';

class SearchScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SearchScreen());
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> previousSearches = [
    "Stress Reduction",
    "Better Sleep",
    "Stress & Anxiety"
  ];
  String searchTerm = '';
  bool searchNotFound = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void onSearch(String value) {
    setState(() {
      searchTerm = value;
      searchNotFound = value.isNotEmpty && !previousSearches
          .any((search) => search.toLowerCase().contains(value.toLowerCase()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 24, top: 20, bottom: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/left_arrow.png',
                      height: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomSearchField(
                      onSearch: onSearch,
                      showCloseIcon: true,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: searchTerm.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Previous Search",
                            style: FontStyles.heading4.copyWith(
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              itemCount: previousSearches.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        previousSearches[index],
                                        style: FontStyles.bodyXLarge.copyWith(
                                          color: AppColor.greyscale600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Image.asset(
                                          'assets/icons/close_icon.png',
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            previousSearches.removeAt(index);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : searchNotFound
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Not Found",
                                  style: FontStyles.heading4,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "We're sorry, your search could not be found.\nPlease try with another keyword.",
                                  textAlign: TextAlign.center,
                                  style: FontStyles.bodyXLarge.copyWith(
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}