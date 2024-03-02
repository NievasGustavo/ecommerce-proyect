import express from 'express';
import loginRoutes from './Routes/login.routes.js';

const app = express();

//middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Rutos
app.use('/', loginRoutes);

app.listen(3000, () => {
    console.log("Server running on port 3000");
});
console.log("Hello world");