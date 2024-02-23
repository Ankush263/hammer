import { Order } from '../models/order.model'
import { deleteOne } from '../middlewares/handleFactory'
import { Product } from '../models/product.model'
import { catchAsync } from '../utils/catch_async'
import { AppError } from '../utils/app_error'


export const createOrder = catchAsync do(req, res, next)
	if !req.body.user
		req.body.user = req.user.id

	const products = req.body.products
	let subTotal = 0
	const id = products[0].product.toString()

	const product =  await Product.findById(id)
	if product
		req.body.seller = product.user
	
	for p in products
		const product2 = await Product.findById(p.product)
		if !product2
			return next(new AppError("Product not found with id: {p.product}", 404))

		subTotal += p.quantity * product2.price
	req.body.subTotal = subTotal
	const order = await Order.create(req.body)

	res.status(200).json
		status: "success"
		data: order


export const deleteOrder = deleteOne Order


export const getOrdersForSellers = catchAsync do(req, res, next)
	const order = await Order.find({seller: req.user.id})

	res.status(200).json(
		status: 'success',
		data: order
	)


export const getOrdersForCustomer = catchAsync do(req, res, next)
	const order = await Order.find({user: req.user.id})

	res.status(200).json(
		status: 'success',
		data: order
	)

