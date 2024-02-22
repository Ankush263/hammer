import mongoose from "mongoose"

const cartSchema = new mongoose.Schema({
	user:
		type: mongoose.Schema.ObjectId
		ref: 'User'

	products: [{
		product:
			type: mongoose.Schema.ObjectId
			ref: 'Product'

		quantity:
			type: Number
			default: 1

		total:
			type: Number
			default: 0
	}]
	
	subTotal:
		type: Number
		default: 0

}, timestamps: true)

export const Cart = mongoose.model("Cart", cartSchema)
