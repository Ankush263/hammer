import mongoose from "mongoose"

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
		lowercase: true,
		unique: true

	password:
		type: String
		required: [true, "please provide a password"]
}, timestamps: true)

const User = mongoose.model("User", userSchema)

export default User
