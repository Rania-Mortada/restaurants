import 'package:flutter/material.dart';
import 'package:restaurants/Featares/Menu/Presentation/pages/menu_screen.dart';



class MyBasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Basket'),
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
                  title: Text('Your order from'),
                  subtitle: Text('Alaska'),
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
              Text('Order details', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Card(
                child: ListTile(
                  leading: Icon(Icons.restaurant_menu),
                  title: Text('Alfredo Chicken Pasta'),
                  subtitle: Text('Regular\nComments: oıl'),
                  trailing: Text('180.00 EGP'),
                  isThreeLine: true,
                ),
              ),
              SizedBox(height: 16),
              Text('Payment details', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
                    "Checkout Now",
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
