import express from 'express'
import { 
	createProduct, 
	setUser, 
	getAllProducts, 
	updateProduct, 
	getOneProduct, 
	deleteProduct 
} from '../controllers/product.controller'
import { protect, restrictTo } from '../controllers/auth.controller'

export const router = express.Router!

router.use protect

router.route('/').post(restrictTo('admin'), setUser, createProduct).get(getAllProducts)

router.route('/:id').patch(restrictTo('admin'), updateProduct).delete(restrictTo('admin'), deleteProduct).get(getOneProduct)

