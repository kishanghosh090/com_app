import { app } from "./app.js";
import "dotenv/config";
import connectToDB from "./db/index.js";

const PORT = process.env.PORT || 8080;

connectToDB()
  .then((dbRes) => {
    console.log(`MONGODB CONNECTED SUCCESSFULLY (${dbRes})...`);
    app.listen(PORT, () => {
      console.log(`⚙️ server is listing at PORT ${PORT}`);
    });
  })
  .catch(() => {
    console.log(`server not started something happening wrong...`);
    process.exit(1);
  });
