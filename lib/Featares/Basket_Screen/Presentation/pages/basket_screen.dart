import 'package:flutter/material.dart';
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
        title: Text(S.of(context).apbar),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'asses/image/backgrod.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/image/immm.jpg',
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error),
                        ),
                      ),
                      title: Text(S.of(context).order,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(S.of(context).alaska),
                      trailing: IconButton(
                        icon: Icon(Icons.add, color: Colors.orange),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(S.of(context).details,
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Icon(Icons.restaurant_menu,
                          size: 40, color: Colors.orange),
                      title: Text(S.of(context).alfredo,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(S.of(context).regular),
                      trailing: Text(S.of(context).EGP,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      isThreeLine: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(S.of(context).Payment,
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PaymentDetailRow(
                              label: S.of(context).subtotal, amount: '180.00 EGP'),
                          PaymentDetailRow(label: S.of(context).tax, amount: '25.20 EGP'),
                          PaymentDetailRow(
                              label: S.of(context).deliveryFees, amount: '35.00 EGP'),
                          Divider(thickness: 1.5),
                          PaymentDetailRow(
                              label: S.of(context).total,
                              amount: '240.20 EGP',
                              isTotal: true),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => MyBasketScreen()));
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                      ),
                      child: Text(
                        S.of(context).Checkout,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
