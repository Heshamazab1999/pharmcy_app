class MedicinesModel {
  dynamic? pRODID;
  dynamic? aCTIVEINGREDIENT;
  dynamic? pRODNAME;
  dynamic? pRODNAMEEN;
  dynamic? bARCODEU;
  dynamic? cONSUMERPRICE;
  dynamic? eXPIREWARNINGDAY;
  dynamic? eXPIREWARNING;
  dynamic? pHOTO;
  dynamic? pRICETAPE;
  dynamic? pRICETABLET;
  dynamic? iNDICATIONS;

  MedicinesModel(
      {this.pRODID,
        this.aCTIVEINGREDIENT,
        this.pRODNAME,
        this.pRODNAMEEN,
        this.bARCODEU,
        this.cONSUMERPRICE,
        this.eXPIREWARNINGDAY,
        this.eXPIREWARNING,
        this.pHOTO,
        this.pRICETAPE,
        this.pRICETABLET,
        this.iNDICATIONS});

  MedicinesModel.fromJson(Map<dynamic, dynamic> json) {
    pRODID = json['PROD_ID'];
    aCTIVEINGREDIENT = json['ACTIVE_INGREDIENT'];
    pRODNAME = json['PROD_NAME'];
    pRODNAMEEN = json['PROD_NAME_EN'];
    bARCODEU = json['BARCODE_U'];
    cONSUMERPRICE = json['CONSUMER_PRICE'];
    eXPIREWARNINGDAY = json['EXPIRE_WARNING_DAY'];
    eXPIREWARNING = json['EXPIRE_WARNING'];
    pHOTO = json['PHOTO'];
    pRICETAPE = json['PRICE_TAPE'];
    pRICETABLET = json['PRICE_TABLET'];
    iNDICATIONS = json['INDICATIONS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PROD_ID'] = this.pRODID;
    data['ACTIVE_INGREDIENT'] = this.aCTIVEINGREDIENT;
    data['PROD_NAME'] = this.pRODNAME;
    data['PROD_NAME_EN'] = this.pRODNAMEEN;
    data['BARCODE_U'] = this.bARCODEU;
    data['CONSUMER_PRICE'] = this.cONSUMERPRICE;
    data['EXPIRE_WARNING_DAY'] = this.eXPIREWARNINGDAY;
    data['EXPIRE_WARNING'] = this.eXPIREWARNING;
    data['PHOTO'] = this.pHOTO;
    data['PRICE_TAPE'] = this.pRICETAPE;
    data['PRICE_TABLET'] = this.pRICETABLET;
    data['INDICATIONS'] = this.iNDICATIONS;
    return data;
  }
}