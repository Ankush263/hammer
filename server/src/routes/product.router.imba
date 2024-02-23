import express from 'express'
import { 
	createProduct, 
	setUser, 
	getAllProducts, 
	updateProduct, 
	getOneProduct, 
	deleteProduct,
	aliasTopProducts
} from '../controllers/product.controller'
import { protect, restrictTo } from '../controllers/auth.controller'

export const router = express.Router!

router.use protect

router.route('/top-5-products').get aliasTopProducts, getAllProducts

router.route('/').post(restrictTo('admin'), setUser, createProduct).get(getAllProducts)

router.route('/:id').patch(restrictTo('admin'), updateProduct).delete(restrictTo('admin'), deleteProduct).get(getOneProduct)

