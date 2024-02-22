import { catchAsync } from '../utils/catch_async'
import { AppError } from '../utils/app_error'
import { Product } from '../models/product.model'
import { Cart } from '../models/cart.model'

export const addToCart = catchAsync do(req, res, next)
	const product = await Product.findById req.params.id

	if !product
		return next(new AppError("Your product doesn't exists", 404))
	
	let cart = await Cart.findOne({ user: req.user.id })

	if !cart
		cart = await Cart.create({
			user: req.user.id,
			products: []
		})

	const existingProducts = cart.products.find(do(item) product and item..product..toString() === req.params.id)

	if existingProducts
		existingProducts.quantity += 1
		existingProducts.total = existingProducts.quantity * product.price
	else
		const newProduct = {
			product: req.params.id,
			quantity: 1,
			total: product.price
		}
		cart.products.push(newProduct)

	cart.subTotal = cart.products.reduce(&, 0) do(total, item) total + item.total
	const newCart = await cart.save()

	res.status(200).json(
		status: 'success'
		data: newCart
	)