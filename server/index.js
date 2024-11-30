const express = require("express");
const app = express();
const mongoose = require("mongoose");

const serviceRouter = require("./routes/serviceRoutes");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/services", serviceRouter);

mongoose.connect("mongodb+srv://vighnesh:Rotomacc27@cluster0.fj1r9.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0").then(() => console.log("MongoDB connected"));

app.listen(8000, () => console.log("Server connected"));