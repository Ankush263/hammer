import app from './app'
import mongoose from 'mongoose'
require('dotenv').config!
const port = process.env.PORT or 3000

def connectDB
	const connectionInstance = await mongoose.connect("{process.env.MONGO_URI}")
	console.log "\nMongoDB is connected to DB HOST: {connectionInstance.connection.host}"

connectDB!

imba.serve app.listen(port)
