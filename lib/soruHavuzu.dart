import 'package:quiz_uygulamasi/soru.dart';
class SoruHavuzu{
int _soruIndex=0;

List<Soru> _soruBankasi=[
  Soru(soruText: 'İtalyanın\' Başkenti Madriddir.',soruCevap: false ),
  Soru(soruText:  'Apple Firmasının Geliştirdiği Web Tarayıcı Safari\'dir.',soruCevap: true ),
  Soru(soruText: 'Flutter Facebook tarafından geliştiriliyor.',soruCevap: false ),
  Soru(soruText: 'Tarihte Sultan unvanını kullanan hukumdar Gazneli Mahmut\'tur',soruCevap: true ),
  Soru(soruText: 'Fatih Sultan Mehmetin\'in babasının adı Yıldırım Beyazıt\tır',soruCevap: false ),
  Soru(soruText: 'Su Element\tir',soruCevap: false ),
  Soru(soruText: '-1 dogal sayı degıldır.',soruCevap: true ),
];

String soruTextGetir(){
  return _soruBankasi[_soruIndex].soruText;
}

bool soruCevap(){
  return _soruBankasi[_soruIndex].soruCevap;
}

void sonrakiSoruGetir(){
  if(_soruIndex<_soruBankasi.length-1){
    _soruIndex++;
  }
}
bool sorularBittiMi(){
  if(_soruIndex>=_soruBankasi.length-1){
    return true;
  }
  else{
    return false;
  }
}

void reset(){
  _soruIndex=0;
}
}