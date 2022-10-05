import 'package:flutter/material.dart';
import 'package:share_app/widgets/primary_button.dart';

class DialogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialogs')),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            PrimaryButton(
              // color: Colors.indigo.shade200,
              title: 'Payment Success Dialog',
              onPressed: () => showDialog(
                context: context,
                builder: (_) => PaymentSuccessDialog(),
              ),
            ),
            PrimaryButton(
              color: Colors.blue.shade200,
              title: 'Beautiful Alert Dialog',
              onPressed: () => showDialog(
                context: context,
                builder: (_) => BeautifulAlertDialog(),
              ),
            ),
            PrimaryButton(
              color: Colors.green,
              title: 'Success Dialog',
              onPressed: () => showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  type: AlertDialogType.SUCCESS,
                  title: "Success Title",
                ),
              ),
            ),
            PrimaryButton(
              color: Colors.cyan,
              title: 'Info Dialog',
              onPressed: () => showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(),
              ),
            ),
            PrimaryButton(
              color: Colors.orange,
              title: 'Warning Dialog',
              onPressed: () => showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  type: AlertDialogType.WARNING,
                  title: "Warning Title",
                  content: "Something warning in this app.",
                ),
              ),
            ),
            PrimaryButton(
              color: Colors.red,
              title: 'Error Dialog',
              onPressed: () => showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  type: AlertDialogType.ERROR,
                  title: "Error Title",
                  content: "Something error in this app.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSuccessDialog extends StatelessWidget {
  final image =
      'http://www.patrickstarm.top:9092/imgs/2022/09/17/6325960f5276b.jpeg';
  final TextStyle subtitle = TextStyle(fontSize: 12.0, color: Colors.grey);
  final TextStyle label = TextStyle(fontSize: 14.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Thank You!",
                  style: TextStyle(color: Colors.green),
                ),
                Text(
                  "Your transaction was successful",
                  style: label,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "DATE",
                      style: label,
                    ),
                    Text("TIME", style: label)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text("26, Sep 2022"), Text("9:10 AM")],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "TO",
                          style: label,
                        ),
                        Text("Patrick Star"),
                        Text(
                          "mth@gmail.com",
                          style: subtitle,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      backgroundImage: NetworkImage(image),
                      child: Icon(Icons.email),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "AMOUNT",
                          style: label,
                        ),
                        Text("\$ 15000"),
                      ],
                    ),
                    Text(
                      "COMPLETED",
                      style: label,
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.account_balance_wallet),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Credit/Debit Card"),
                          Text(
                            "Master Card ending ***8",
                            style: subtitle,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BeautifulAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(75),
              bottomLeft: Radius.circular(75),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade200,
                child: Image.network(
                  'http://www.patrickstarm.top:9092/imgs/2022/09/27/63324ebbeeec5.jpg',
                  width: 60,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Alert!",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(
                          "Do you want to continue to turn off the services?"),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                            child: Text("No"),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: MaterialButton(
                            child: Text("Yes"),
                            color: Colors.green,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final AlertDialogType type;
  final String title;
  final String content;
  final Widget? icon;
  final String buttonLabel;
  final TextStyle titleStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  final TextStyle labelStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
  );

  CustomAlertDialog(
      {Key? key,
      this.title = 'Beautiful title',
      this.content = 'Information to your user describing the situation.',
      this.icon,
      this.type = AlertDialogType.INFO,
      this.buttonLabel = 'Ok'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: icon ??
                    Icon(
                      _getIconForType(type),
                      color: _getColorForType(type),
                      size: 50,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: MaterialButton(
                  padding: const EdgeInsets.all(10.0),
                  color: _getColorForType(type),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    buttonLabel,
                    style: labelStyle,
                  ),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForType(AlertDialogType type) {
    switch (type) {
      case AlertDialogType.SUCCESS:
        return Icons.check_circle;
      case AlertDialogType.INFO:
        return Icons.info;
      case AlertDialogType.WARNING:
        return Icons.warning;
      case AlertDialogType.ERROR:
        return Icons.error;
      default:
        return Icons.android;
    }
  }

  Color _getColorForType(AlertDialogType type) {
    switch (type) {
      case AlertDialogType.WARNING:
        return Colors.orange;
      case AlertDialogType.SUCCESS:
        return Colors.green;
      case AlertDialogType.ERROR:
        return Colors.red;
      case AlertDialogType.INFO:
        return Colors.cyan;
      default:
        return Colors.blue;
    }
  }
}

enum AlertDialogType {
  SUCCESS,
  ERROR,
  WARNING,
  INFO,
}
