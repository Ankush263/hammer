import { catchAsync } from '../utils/catch_async'
import { AppError } from '../utils/app_error'
import { Product } from '../models/product.model'
import { Cart } from '../models/cart.model'
import { deleteOne } from '../middlewares/handleFactory'


export const addToCart = catchAsync do(req, res, next)
	const { productId } = req.body
	const product = await Product.findById productId

	if !product
		return next(new AppError("Your product doesn't exists", 404))
	
	let cart = await Cart.findOne({ user: req.user.id })

	if !cart
		cart = await Cart.create({
			user: req.user.id,
			products: []
		})

	const existingProducts = cart.products.find(do(item) product and item..product..toString() === productId)

	if existingProducts
		existingProducts.quantity += 1
		existingProducts.total = existingProducts.quantity * product.price
	else
		const newProduct = {
			product: productId,
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


export const removeFromCart = catchAsync do(req, res, next)
	const cart = await Cart.findOne user: [req.user.id]
	if !cart
		return next(new AppError("Cart doesn't exist", 404))

	const {productId: productId} = req.body
	const product = await Product.findById(productId)
	const existingProductIndex = cart.products.findIndex do(item) item..product..toString() === productId

	if existingProductIndex === -1
		return next(new AppError("Product does not exist in the cart", 404))

	const existingProduct = cart.products[existingProductIndex]
	if existingProduct.quantity > 1
		existingProduct.quantity -= 1
	else
		cart.products.splice existingProductIndex, 1
		
	existingProduct.total = existingProduct.quantity * product.price
	cart.subTotal = cart.products.reduce(&, 0) do(total, item) total + item.total
	const newCart = await cart.save()
	res.status(200).json
		status: "success"
		data: newCart


export const deleteCart = deleteOne Cart


export const getMyCart = catchAsync do(req, res, next)
	const cart = await Cart.find({ user: req.user.id }).populate(
		path: 'products.product'
		select: 'name description images price'
	)
	res.status(200).json(
		status: 'success'
		data: cart
	)

	