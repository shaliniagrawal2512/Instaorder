import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  Widget offers(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint),
        SizedBox(
          height: 15,
        ),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 5,
      ),
      //width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[850],
      ),
      child: Row(
        children: [
          offers('50% off on chinese', 'roll\'s hub'),
          offers('20% off on first order', 'sheffron'),
          offers('10% off on all TRC', 'taj hotel'),
          offers('30% off on italian', 'alkarene'),
          offers('5% off on all orders', 'hotel galaxy'),
          offers('50% off on chinese', 'roll\'s hub'),
          offers('50% off on chinese', 'roll\'s hub'),
          offers('50% off on chinese', 'roll\'s hub'),
        ],
      ),
    );
  }
}
