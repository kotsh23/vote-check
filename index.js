const express = require("express");
const helmet = require("helmet");
const cors = require("cors");
const bodyParser = require("body-parser");
const votecheck = require("./votecheck");

const app = express();
var jsonParser = bodyParser.json();
app.use(helmet());
app.use(cors());

app.use("/votecheck", jsonParser, votecheck);

app.listen(1234, "0.0.0.0", () => {
  console.log("VoteCheck Backend port 1234");
});
