import 'package:flutter/material.dart';
import 'package:restaurants/Featares/Menu/Presentation/pages/menu_screen.dart';

import '../../../../generated/l10n.dart';
class MyBasketScreen extends StatefulWidget {
  @override
  State<MyBasketScreen> createState() => _MyBasketScreenState();
}

class _MyBasketScreenState extends State<MyBasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).apbar,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.orange,),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  leading: Image.asset('asses/image/immm.jpg',
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error)),
                  title: Text(S.of(context).order,),
                  subtitle: Text(S.of(context).alaska,),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(S.of(context).details, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Card(
                child: ListTile(
                  leading: Icon(Icons.restaurant_menu),
                  title: Text(S.of(context).alfredo,),
                  subtitle: Text(S.of(context).regular,),
                  trailing: Text(S.of(context).EGP,),
                  isThreeLine: true,
                ),
              ),
              SizedBox(height: 16),
              Text(S.of(context).Payment, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PaymentDetailRow(label: 'Subtotal', amount: '180.00 EGP'),
                      PaymentDetailRow(label: 'Tax', amount: '25.20 EGP'),
                      PaymentDetailRow(label: 'Delivery fees', amount: '35.00 EGP'),
                      Divider(),
                      PaymentDetailRow(label: 'Total', amount: '240.20 EGP', isTotal: true),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 300,),
              Center(
                child: MaterialButton(
                  color: Colors.orange,
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => MyBasketScreen()));
                    // }
                  },
                  elevation: 5,
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  height: 65,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
    S.of(context).Checkout,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: ElevatedButton(
      //       onPressed: () {
      //     },
      //       child: Text('Checkout',style: TextStyle
      //         (fontSize: 20,color: Colors.white),
      //
      //       ),
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: Colors.orange,
      //
      //       ),
      //
      //     ),
      //   ),
      // ),
    );
  }
}

class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  PaymentDetailRow({
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
