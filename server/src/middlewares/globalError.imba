import { AppError } from '../utils/app_error'

const handleCastErrorDB = do(err)
	const message = "Invalid : .{err.path}{err.value}"
	return new AppError(message, 401)


const handleDuplicateFieldsDB = do(err)
	const value = Object.keys(err.keyValue)[0]
	const message = "Duplicate field value , Please use another value.{value}"
	return new AppError(message, 400)


const handleValidationErrorDB = do(err)
	const errors = Object.values(err.errors).map do(el) el.message
	const message = "Invalid input data. {errors.join(". ")}"
	return new AppError(message, 400)


const handleJWTError = do(err) new AppError("Invalid token, Please log in again", 401)


const handleJWTExpiredError = do(err) new AppError("Your token has expired!, Please log in again", 401)


const sendErrorDev = do(err, res)
	res.status(err.statusCode).json
		status: [err.status]
		error: err
		message: [err.message]
		stack: [err.stack]


const sendErrorProd = do(err, res)
	if err.isOperational
		res.status(err.statusCode).json
			status: [err.status]
			message: [err.message]
	else
		console.error "ERROR", err
		res.status(500).json
			status: "error"
			message: "Something went very wrong!"


export const globalError = do(err, req, res, next)
	err.statusCode = err.statusCode or 500
	err.status = err.status or "error"
	res.set "Access-Control-Allow-Origin", "*"

	if process.env.NODE_ENV === "development"
		sendErrorDev err, res

	else if process.env.NODE_ENV === "production"
		let error = err

		if error.name === "CastError"
			error = handleCastErrorDB error

		if error.code === 11000
			error = handleDuplicateFieldsDB error

		if error.name === "ValidationError"
			error = handleValidationErrorDB error

		if error.name === "JsonWebTokenError"
			error = handleJWTError error

		if error.name === "TokenExpiredError"
			error = handleJWTExpiredError error

		sendErrorProd error, res

