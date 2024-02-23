import mongoose from 'mongoose'


const orderSchema = new mongoose.Schema({
	user:
		type: mongoose.Schema.ObjectId
		ref: "User"

	seller:
		type: mongoose.Schema.ObjectId
		ref: "User"

	products: [{
		product:
			type: mongoose.Schema.ObjectId
			ref: "Product"

		quantity:
			type: Number
			default: 1
	}]

	subTotal:
		type: Number
		default: 0

	orderState:
		type: String
		enum: [
			"Ordered"
			"Shipped"
			"Out for Delivery"
			"Delivered"
		]
		default: "Ordered"

	instruction:
		type: String

}, timestamps: true)


export const Order = mongoose.model("Order", orderSchema)

