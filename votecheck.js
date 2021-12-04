const express = require("express");
const dns = require("dns");
const { voteModule } = require("./config/dbOperation");
async function getDomainIp(domain) {
  return new Promise((resolve, reject) => {
    dns.lookup(domain, (err, address, family) => {
      if (err) reject(err);
      resolve(address);
    });
  });
}

const app = express();

app.post("/", async (req, res) => {
  try {
    const requester_ip =
      req.headers["x-real-ip"] || req.connection.remoteAddress;

    const TOP100SERVER_IP = await getDomainIp("top100server.com");

    if (TOP100SERVER_IP != requester_ip)
      return res.status(401).json({
        error: "Not allowed",
      });

    // getting parameters to do whatever you want
    const { userIp, user, id: serverId } = req.body;
    const voteModule = await voteModule({ user, userIp });

    console.log(voteModule.recordeset);

    console.log(req.body);

    return res.status(200).send("Thank you TOP100SERVER :D");
  } catch (error) {
    return res.status(401).json({ error });
  }
});

module.exports = app;
