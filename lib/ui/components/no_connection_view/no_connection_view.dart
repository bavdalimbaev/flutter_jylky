import 'package:flutter/material.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 150.0,
            color: Colors.red[300],
          ),
          Text(
            'Нет подключения к сети ...',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 21.0,
                ),
          ),
        ],
      ),
    );
  }
}
