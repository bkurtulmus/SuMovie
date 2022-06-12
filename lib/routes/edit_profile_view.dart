import 'package:flutter/material.dart';
import 'package:user_database/routes/profile_view.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;

  const TextFieldWidget({
    this.maxLines = 1,
    required this.label,
    required this.text,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  int index = 0;
  bool IsPrivate = false;
  final screens = [
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
  ];
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }


  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        maxLines: widget.maxLines,
      ),
    ],
  );
}

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
  static const String routeName = '/feed';
}

class _EditProfileViewState extends State<EditProfileView> {
  int index = 0;
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView()));
          },
        ),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: ClipOval(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        radius: 90,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),

                    const SizedBox(width: 8,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Edit Photo",style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if(fav)
                      setState(() => fav=false);
                    else
                      setState(() => fav=true);
                  },
                  child: Text(fav ? 'Make Profile Public' : 'Make Profile Private')),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Username',
                  text: 'Lorem',
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: 'Lorem@lorem.com',
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Password',
                  text: 'Loremipsum',
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Location',
                  text: 'Lorem',
                  maxLines: 1,
                ),
                TextButton(
                  child: Text('SAVE'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon:Icon(Icons.email_outlined),
              selectedIcon: Icon(Icons.email),
              label: 'Mail',
            ),
            NavigationDestination(
              icon:Icon(Icons.chat_bubble_outlined),
              selectedIcon: Icon(Icons.chat_bubble_outlined),
              label: 'Chat',
            ),
            NavigationDestination(
              icon:Icon(Icons.group_outlined),
              selectedIcon: Icon(Icons.group_outlined),
              label: 'Spaces',
            ),
            NavigationDestination(
              icon:Icon(Icons.videocam_outlined, size: 30),
              selectedIcon: Icon(Icons.videocam_outlined),
              label: 'Meet',
            ),
          ],
        ),
      ),
    );
  }
}