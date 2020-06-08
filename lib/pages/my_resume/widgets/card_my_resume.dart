import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_resumo/data/model/wealth_summary.dart';
import 'package:meu_resumo/values/colors.dart';
import 'package:meu_resumo/values/size_config.dart';
import 'package:meu_resumo/values/strings.dart';
import 'package:meu_resumo/values/text_styles.dart';

class MyResumeCard extends StatelessWidget {
  final double size;
  final WealthSummary wealthSummary;

  MyResumeCard(this.size, this.wealthSummary);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: backgroundGrey,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(size * 0.04267),
        color: cardColor,
        child: Padding(
          padding: EdgeInsets.all(size * 0.06400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: size * 0.00267),
                    child: Text(cardTitle, style: cardTextStyleTotalBoldBlue),
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size * 0.09333, bottom: size * 0.07200),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: size * 0.01867),
                      child: Text(
                        cardTitleTotal,
                        style: cardTextStyleSimpleTextGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size * 0.05333),
                      child: Text(
                          '${NumberFormat.currency(locale: 'pt_br', symbol: 'R\$').format(wealthSummary.total)}',
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              _buildItem(cardTitleProfitability,
                  '${wealthSummary.profitability.toStringAsFixed(3)}%'),
              _buildItem(
                  cardTitleCDI, '${wealthSummary.cdi.toStringAsFixed(2)}%'),
              _buildItem(cardTitleGain, 'R\$ ${wealthSummary.gain}'),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenWidth * 0.05600),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: titleColor, width: 1),
                      borderRadius: BorderRadius.circular(40)),
                  color: Colors.white,
                  textColor: titleColor,
                  child: Text("VER MAIS"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String text) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.screenWidth * 0.01333,
          bottom: SizeConfig.screenWidth * 0.01333),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: cardTextStyleSimpleTextGrey,
          ),
          Text(
            text,
            style: cardTextStyleDataBoldBlue,
          )
        ],
      ),
    );
  }
}
