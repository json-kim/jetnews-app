import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/usecase/interest/data/interest_data.dart';

class InterestListTile extends StatelessWidget {
  final InterestData interestData;
  final void Function() onTap;

  const InterestListTile({
    required this.interestData,
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
          title: Text(interestData.interest.title),
          trailing: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(25),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor:
                    interestData.isChecked ? Colors.red : Colors.white,
                child: interestData.isChecked
                    ? const Icon(Icons.check, color: Colors.white)
                    : const Icon(Icons.add),
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
