import { User } from '../models/user.model.imba'
import { catchAsync } from '../utils/catch_async.imba'
import { AppError } from '../utils/app_error.imba'
import { promisify } from 'util'
import bcrypt from 'bcryptjs'
import jwt from 'jsonwebtoken'
import 'dotenv/config'


const signToken = do(id) return jwt.sign({id: id}, process.env.JWT_SECRET, expiresIn: process.env.JWT_EXPIRES_IN)
	

const createAndSendToken = do(user, statusCode, res)
	const token = signToken(user._id)
	const cookieOptions = 
		expires: new Date(Date.now() + Number(process.env.JWT_COOKIE_EXPIRES_IN) * 24 * 60 * 60 * 1000)
		httpOnly: true

	res.cookie "jwt", token, cookieOptions
	res.json token: token


export const signup = catchAsync do(req, res, next)
	const { firstName, lastName, email , password, role } = req.body

	const hashedPassword = bcrypt.hashSync(password, 12)

	const newUser = await User.create
		firstName: firstName,
		lastName: lastName,
		email: email,
		password: hashedPassword,
		role: role

	createAndSendToken newUser, 201, res


export const login = catchAsync do(req, res, next)
	const { email, password } = req.body
	if !email or !password
		return next(new AppError("Please provide email & password", 404))
	const user = await User.findOne({email}).select("+password")

	if !user or !bcrypt.compareSync(password, user.password)
		return next(new AppError("Incorrect email or password", 401))
	createAndSendToken user, 200, res


export const protect = catchAsync do(req, res, next)
	let token

	if req.headers.authorization and req.headers.authorization.startsWith("Bearer")
		token = req.headers.authorization.split(" ")[1]
	else if req.cookies.jwt
		token = req.cookies.jwt

	if !token
		return next(new AppError("You aren't logged in! Please log in to get access", 401))

	const decoded = jwt.decode(token)
	let freshUser
	freshUser = await User.findById(decoded.id)
	if !freshUser
		return next(new AppError("The user belonging to this token does no longer exist", 401))

	req.user = freshUser
	next!


export const restrictTo = do(...roles)
	return do(req, res, next)
		if !roles.includes req.user.role
			return next(new AppError("You don't have permission to perform this action", 403))

		next!

