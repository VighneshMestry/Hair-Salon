const mongoose = require("mongoose")

const serviceSchema = new mongoose.Schema({
    serviceName: {
        type: String,
        required: true,
    },
    originalPrice: {
        type: String,
        required: true,
    },
    discountedPrice: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    category: {
        type: String,
        required: true,
    },
    location: {
        type: String,
        required: true,
    },
    rating: {
        type: Number,
        required: true,
    },
    imageUrl: {
        type: String,
        required: false,
    },
});

const Service = mongoose.model("service", serviceSchema);

module.exports = Service;