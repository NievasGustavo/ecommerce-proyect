import express from "express";
import productsRoutes from "./Routes/products.routes.js";
import { sequelize } from "./database/connection.js";
import errorHandler from "./Middlewares/errorHandler.js";

/* crypto:node para generar una uuid*/
const app = express();

//middlewares
app.use(express.json());

// Rutos
app.use("/", productsRoutes);
async function main() {
  try {
    await sequelize.sync({ force: false });
    console.log("All models were synchronized successfully.");
    app.listen(3000, () => {
      console.log("Server running on port 3000");
    });
    console.log("Hello world");
  } catch (error) {
    console.log("Unable to connect to the database:", error);
  }
}

app.use(errorHandler)
main();
