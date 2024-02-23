import { catchAsync } from '../utils/catch_async'
import { AppError } from '../utils/app_error'
import { createOne, getAll, getOne, updateOne, deleteOne } from '../middlewares/handleFactory.imba'
import { Product } from '../models/product.model'

export const setUser = catchAsync do(req, res, next)
	if !req.body.user
		req.body.user = req.user.id
	next!

export const createProduct = createOne Product

export const getAllProducts = getAll Product

export const getOneProduct = getOne Product, ''

export const updateProduct = updateOne Product

export const deleteProduct = deleteOne Product


export const aliasTopProducts = do(req, res, next)
	req.query.limit = '5'
	req.query.sort = '-totalOrdered';
	req.query.fields = 'name,price,images'
	next!
