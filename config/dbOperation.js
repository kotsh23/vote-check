const dbConfig = require("./dbConfig");
const sql = require("mssql");

const voteModule = async ({ user, userIp }) => {
  try {
    const pool = await sql.connect(dbConfig);
    const result = await pool
      .request()
      .input("user", sql.Int, user)
      .input("userIp", sql.VarChar, userIp)
      .execute("_VoteManager");
    pool.close();
    return result;
  } catch (error) {
    console.log("modules:_VoteManager ", error);
  }
};

module.exports = { voteModule };
