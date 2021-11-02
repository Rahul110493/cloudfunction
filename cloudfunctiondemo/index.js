//Import the necessary libraries/declare the necessary objects
var express = require("express");
var myParser = require("body-parser");
var app = express();

app.use(myParser.urlencoded({extended : true}));
app.use(myParser.json());
app.post("/data", function(request, response) {
  console.log(request.body); //This prints the JSON document received (if it is a JSON document)
});

//Start the server and make it listen for connections on port 8080

app.listen(8080);

module.exports = app;
