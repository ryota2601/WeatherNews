void getWeather() {
  String url = "http://weather.livedoor.com/forecast/rss/index.xml";
  XML xml = loadXML( url );
  XML [] item = xml.getChild("channel").getChildren("item");

  for ( int i=1; i<item.length; i++ ) {
    String discription = item[i].getChild("description").getContent();
    if (i!=7) {
      W[i] = discription.substring(discription.indexOf("天気は")+3, discription.indexOf("最高気温")-1);
      Htemp[i] = discription.substring(discription.indexOf("最高気温")+5, discription.indexOf("最低気温")-2);
      Ltemp[i] = discription.substring(discription.indexOf("最低気温")+5, discription.indexOf("でしょう")-1);
    } else {
      W[i] = discription.substring(discription.indexOf("天気は")+3, discription.indexOf("最高気温")-1);
      Htemp[i] = discription.substring(discription.indexOf("最高気温")+5, discription.indexOf("でしょう")-2);
      Ltemp[i] = "0";
    }


    if (W[i].equals("晴れ")) {
      t_tenki[i-1] = tenki[0];
    } else if (W[i].equals("晴のち曇")) {
      t_tenki[i-1] = tenki[1];
    } else if (W[i].equals("晴時々曇")) {
      t_tenki[i-1] = tenki[2];
    } else if (W[i].equals("曇のち晴")) {
      t_tenki[i-1] = tenki[3];
    } else if (W[i].equals("曇時々晴")) {
      t_tenki[i-1] = tenki[4];
    } else if (W[i].equals("曇り")) {
      t_tenki[i-1] = tenki[5];
    } else if (W[i].equals("晴のち雨")) {
      t_tenki[i-1] = tenki[6];
    } else if (W[i].equals("晴時々雨")) {
      t_tenki[i-1] = tenki[7];
    } else if (W[i].equals("雨のち晴")) {
      t_tenki[i-1] = tenki[8];
    } else if (W[i].equals("雨時々晴")) {
      t_tenki[i-1] = tenki[9];
    } else if (W[i].equals("雨のち曇")) {
      t_tenki[i-1] = tenki[10];
    } else if (W[i].equals("雨時々曇")) {
      t_tenki[i-1] = tenki[11];
    } else if (W[i].equals("曇のち雨")) {
      t_tenki[i-1] = tenki[12];
    } else if (W[i].equals("曇時々雨")) {
      t_tenki[i-1] = tenki[13];
    } else if (W[i].equals("雨")) {
      t_tenki[i-1] = tenki[14];
    } else if (W[i].equals("雨のち雪")) {
      t_tenki[i-1] = tenki[15];
    } else if (W[i].equals("雨時々雪")) {
      t_tenki[i-1] = tenki[16];
    } else if (W[i].equals("雪のち雨")) {
      t_tenki[i-1] = tenki[17];
    } else if (W[i].equals("雪時々雨")) {
      t_tenki[i-1] = tenki[18];
    } else if (W[i].equals("曇のち雪")) {
      t_tenki[i-1] = tenki[19];
    } else if (W[i].equals("曇時々雪")) {
      t_tenki[i-1]= tenki[20];
    } else if (W[i].equals("雪のち曇")) {
      t_tenki[i-1]= tenki[21];
    } else if (W[i].equals("雪時々曇")) {
      t_tenki[i-1]= tenki[22];
    } else if (W[i].equals("晴のち雪")) {
      t_tenki[i-1]= tenki[23];
    } else if (W[i].equals("晴時々雪")) {
      t_tenki[i-1]= tenki[24];
    } else if (W[i].equals("雪のち晴")) {
      t_tenki[i-1]= tenki[25];
    } else if (W[i].equals("雪時々晴")) {
      t_tenki[i-1]= tenki[26];
    } else if (W[i].equals("雪")) {
      t_tenki[i-1]= tenki[27];
    }

    println(W[i]);
    println(Htemp[i]);
    println(Ltemp[i]);
  }
}
