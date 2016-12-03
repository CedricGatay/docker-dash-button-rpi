var dash_button = require('node-dash-button');
var request = require('request');
var debug = 0;
var macAdress=process.env.DASH_MAC;
var auth=process.env.AUTH;
var url=process.env.URL;
var method=process.env.METHOD;
console.log("Started dash button listener app", macAdress, auth, url, method);
// ac:63:be:a4:5e:6b
var dash = dash_button(macAdress, null, null, "all");
dash.on("detected", function (btn){
  console.log("Button found with mac address :", btn);
  request({
    url: url,
    method: method,
    headers : {
      "Authorization" : "Basic " + auth
    }
  },
  function (error, response, body) {
    if (!error && response.statusCode == 200) {
      if (debug == 1) {console.log((new Date()) + "Got response Value: " + response.statusCode);}
    }else{
      console.log((new Date()) + " - Error : "  + error + " - Status Code:" + response.statusCode);
    }
  });
});
