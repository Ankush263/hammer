import mongoose from "mongoose"

const productSchema = new mongoose.Schema({
	user:
		type: mongoose.Schema.ObjectId
		ref: 'User'

	name:
		type: String
		required: [true, "Product must have a name"]

	description:
		type: String
		required: [true, "Product must have a description"]
	
	image: 
		type: String
	
	price: 
		type: Number

	stock:
		type: Number

	ratingsAverage: 
		type: Number,
		default: 0,
		min: [0, 'rating must be greater then or equal then 1.0'],
		max: [5, 'rating must be less then or equal then 5.0'],
		set: (val) => Math.round(val * 10) / 10,
	
	ratingsQuantity: 
		type: Number,
		default: 0,
	
}, timestamps: true)

const Product = mongoose.model("Product", productSchema)

export default Product
