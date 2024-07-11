import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double basicPay = 0;
  double transportAllowance = 0;
  double housingAllowance = 0;
  double grossSalary = 0;

  final TextEditingController basicPayController = TextEditingController();
  final TextEditingController transportAllowanceController = TextEditingController();
  final TextEditingController housingAllowanceController = TextEditingController();

  void calculateGrossSalary() {
    setState(() {
      grossSalary = basicPay + transportAllowance + housingAllowance;
    });
  }

  @override
  void dispose() {
    basicPayController.dispose();
    transportAllowanceController.dispose();
    housingAllowanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: basicPayController,
              onChanged: (value) {
                basicPay = double.tryParse(value) ?? 0.0;
                calculateGrossSalary();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Basic Pay',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: transportAllowanceController,
              onChanged: (value) {
                transportAllowance = double.tryParse(value) ?? 0.0;
                calculateGrossSalary();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Transport Allowance',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: housingAllowanceController,
              onChanged: (value) {
                housingAllowance = double.tryParse(value) ?? 0.0;
                calculateGrossSalary();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Housing Allowance',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Gross Salary Income: \$${grossSalary.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
