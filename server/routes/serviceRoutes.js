const express = require("express");
const Service = require("../models/service_schema");
const router = express.Router();

router.get("/getAllServices", (req, res) => {});

router.post("/uploadService", async (req, res) => {
  const {
    serviceName,
    originalPrice,
    discountedPrice,
    description,
    category,
    location,
    rating,
  } = req.body;

  
  console.log(req.body);
  const service = await Service({
    serviceName,
    originalPrice,
    discountedPrice,
    description,
    category,
    location,
    rating,
  });
  console.log("2nd");
  console.log(service.serviceName);
  await Service.create(service);

  return res.status(200).json({Success: "Service details received"});
});


module.exports = router;