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

	totalOrdered:
		type: Number
		default: 0
	
}, timestamps: true)

export const Product = mongoose.model("Product", productSchema)
