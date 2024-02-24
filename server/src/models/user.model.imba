import mongoose from "mongoose"
import validator from 'validator'

const userSchema = new mongoose.Schema({
	firstName:
		type: String
		required: [true, "User must have an email"]

	lastName:
		type: String
		required: [true, "User must have an email"]
		
	email:
		type: String
		required: [true, "User must have an email"]
		lowercase: true
		unique: true
		validate: [validator.isEmail, 'please provide a valid email']

	password:
		type: String
		required: [true, "please provide a password"]
		minlength: 8

	role:
		type: String
		enum: ['customer', 'admin']
		default: 'customer'
}, timestamps: true)

export const User = mongoose.model("User", userSchema)

