import { catchAsync } from '../utils/catch_async.imba'
import { AppError } from '../utils/app_error.imba'
import { APIFeatures } from '../utils/api_features.imba'

export const deleteOne = do(Model) catchAsync do(req, res, next)
	const doc = await Model.findByIdAndDelete(req.params.id)
	if !doc
		return next(new AppError("No document found with that Id", 404))
	res.status(204).json
		status: "success"
		data: null


export const updateOne = do(Model) catchAsync do(req, res, next)
	const doc = await Model.findByIdAndUpdate(req.params.id, req.body,
			new: true,
			runValidators: true,
		)
	
	if !doc
		return next(new AppError("No document found with that Id", 404))

	res.status(200).json
		status: "success"
		data: doc


export const createOne = do(Model) catchAsync do(req, res, next)
	const doc = await Model.create req.body

	res.status(201).json(
		status: "success"
		data: doc
	)


export const getOne = do(Model, popOption) catchAsync do(req, res, next)
	let query = Model.findById req.params.id
	if popOption
		query = query.populate popOption

	const doc = await query
	
	if !doc
		return next(new AppError("No document found with that Id", 404))

	res.status(200).json(
		status: 'success'
		data: doc
	)

	
export const getAll = do(Model) catchAsync do(req, res, next)
	let filter = {}
	if req.params.userId
		filter = user: [req.params.userId]

	const features = new APIFeatures(Model.find(filter), req.query).filter().sort().limitFields().limitResults()
	const doc = await features.query

	res.status(200).json
		status: "success"
		results: [doc.length]
		data: doc
