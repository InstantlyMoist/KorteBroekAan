import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/popups/base_popup.dart';

class FilterPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePopup(
      headerTitle: "Informatie over filters",
      child: Text(
        "Hier komt de informatie van de filters, deze moet nog geschreven, maar dit is tenslotte een proof of concept.",
        style: TextStyle(
          height: 1.5,
          color: Color(0xff2F4859),
        ),
      ),
    );
  }
}
