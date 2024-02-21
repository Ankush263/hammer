export class AppError < Error
	def constructor(message, statusCode)
		super(message)
		statusCode = statusCode
		status = "{statusCode}".startsWith("4") ? "fail" : "error"
		isOperational = true
		Error.captureStackTrace this, constructor
