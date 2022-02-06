import 'package:flutter/material.dart';

class InterestListTile extends StatelessWidget {
  final void Function() onTap;

  const InterestListTile({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.network(
              'https://github.com/android/compose-samples/blob/main/JetNews/app/src/main/res/drawable-nodpi/placeholder_1_1.png?raw=true'),
          title: Text('Jetpack Compose'),
          trailing: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
              ),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1,
        ),
      ],
    );
  }
}
