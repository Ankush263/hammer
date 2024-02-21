import User from '../models/user.model.imba'
import catchAsync from '../utils/catch_async.imba'
import { AppError } from '../utils/app_error.imba'
import bcrypt from 'bcryptjs'
import jwt from 'jsonwebtoken'
require('dotenv').config();


const signToken = do(id) return jwt.sign({id: id}, process.env.JWT_SECRET, expiresIn: process.env.JWT_EXPIRES_IN)
	

const createAndSendToken = do(user, statusCode, res)
	const token = signToken(user._id)
	const cookieOptions = 
		expires: new Date(Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000)
		httpOnly: true

	if process.env.NODE_ENV === "production"
		cookieOptions.secure = true

	res.cookie "jwt", token, cookieOptions
	res.json token: token


const signup = catchAsync do(req, res, next)
	const {firstName, lastName, email , password} = req.body

	const hashedPassword = bcrypt.hashSync(password, 12)

	const newUser = await User.create
		firstName: firstName,
		lastName: lastName,
		email: email,
		password: hashedPassword

	createAndSendToken newUser, 201, res


const login = catchAsync do(req, res, next)
	const { email, password } = req.body
	if !email or !password
		return next(new AppError("Please provide email & password", 404))
	const user = await User.findOne({email}).select("+password")

	if !user or !bcrypt.compareSync(password, user.password)
		return next(new AppError("Incorrect email or password", 401))
	createAndSendToken user, 200, res


export {signup, login}
