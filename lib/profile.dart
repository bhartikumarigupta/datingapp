import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileEditorPage extends StatefulWidget {
  const ProfileEditorPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditorPage> createState() => _ProfileEditorPageState();
}

class _ProfileEditorPageState extends State<ProfileEditorPage> {
  var basic = ["Education", "Gender", "Orientation", "Work"];
  var arr = [
    Icons.work,
    Icons.boy,
    Icons.outdoor_grill_rounded,
    Icons.work_rounded
  ];
  var brr = [
    Icons.boy,
    Icons.message,
    Icons.local_drink,
    Icons.height,
    Icons.favorite_border_sharp,
    Icons.psychology,
    Icons.messenger,
    Icons.temple_hindu,
    Icons.smoke_free,
    Icons.work_outline,
    Icons.zoom_out,
    Icons.living
  ];
  var information = [
    "Children",
    "Conversation",
    "Drink",
    "Height",
    "Looking for",
    "Political Preference",
    "Pronouns",
    "Religion",
    "Smoke",
    "Workout",
    "Zodiac",
    "Living in"
  ];
  List<String> selectedInterests = [];

  final List<Map<String, dynamic>> interests = [
    {
      "name": "Romance",
      "icon": Icons.favorite,
    },
    {"name": "Fantasy", "icon": Icons.menu_book},
    {"name": "Chinese", "icon": Icons.food_bank_rounded},
    {"name": "Reading", "icon": Icons.menu_book_rounded},
    {"name": "Cooking", "icon": Icons.restaurant},
    {"name": "Afro", "icon": Icons.sports_soccer},
    {"name": "Shopping", "icon": Icons.shopping_bag},
    {"name": "Music", "icon": Icons.music_note},
    {"name": "Beach", "icon": Icons.beach_access},
    {"name": "Mountains", "icon": Icons.tour},
    // Add more interests here...
  ];

  String aboutText = '';

  double _getImageSize(int index) {
    if (index == 0) {
      return 60; // Decreased the size of the first image to 60
    } else if (index == 1 || index == 2) {
      return 40; // Decreased the size of the second and third images to 40
    } else {
      return 30; // Decreased the size of the last two images to 30
    }
  }

  int getWordCount(String text) {
    return text.trim().split(' ').where((word) => word.isNotEmpty).length;
  }

  // Photo post widget
  Widget _buildPhotoPost() {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              // You can use any image widget here, for simplicity, using placeholders.
              return Container(
                height: _getImageSize(index),
                color: Colors.pink[50],
                child: Center(
                  child: Icon(
                    Icons.add_circle,
                    // size: _getImageSize(index),
                    color: Colors.pink[200],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(onPressed: () {}, icon: BackButton()),
            ),
            _buildPhotoPost(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.pink[50], // Set the background color to pink
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(
                  alignment: Alignment
                      .bottomRight, // Align the word count text to the bottom right corner
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          aboutText = value;
                        });
                      },
                      maxLines: 8,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: '"Tell them about you."',
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                "Basics",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink[50],
                        child: Icon(arr[index], color: Colors.black87),
                      ),
                      title: Text("${basic[index]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: basic.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 15,
                  thickness: 0,
                  color: Colors.white,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                "Additional Information",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink[50],
                        child: Icon(brr[index], color: Colors.black87),
                      ),
                      title: Text("${information[index]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: information.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 15,
                  thickness: 0,
                  color: Colors.white,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Languages",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Interests",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Wrap(
                spacing: 7,
                children: interests
                    .map(
                      (interest) => ChoiceChip(
                        backgroundColor: Colors.white,
                        selectedColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: selectedInterests.contains(interest["name"])
                                ? Colors.grey
                                : Colors.red[400]!,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              interest["icon"],
                              color:
                                  selectedInterests.contains(interest["name"])
                                      ? Colors.red
                                      : Colors.black87,
                            ),
                            SizedBox(width: 4),
                            Text(
                              interest["name"],
                              style: TextStyle(
                                color:
                                    selectedInterests.contains(interest["name"])
                                        ? Colors.red
                                        : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        selected: selectedInterests.contains(interest["name"]),
                        onSelected: (isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedInterests.add(interest["name"]);
                            } else {
                              selectedInterests.remove(interest["name"]);
                            }
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            // Add Photo Post
          ],
        ),
      ),
    );
  }
}
