import express from 'express'
import { 
	createProduct, 
	getAllProducts, 
	updateProduct, 
	getOneProduct, 
	deleteProduct,
	aliasTopProducts,
	uploadImg,
	deletePhoto,
	totalListedProduct
} from '../controllers/product.controller'
import { protect, restrictTo } from '../controllers/auth.controller'

export const router = express.Router!

router.use protect

router.route('/top-5-products').get aliasTopProducts, getAllProducts
router.route('/myProducts').get restrictTo('admin'), totalListedProduct

router.route('/').post(restrictTo('admin'), uploadImg, createProduct).get(getAllProducts)

router.route('/:id').patch(restrictTo('admin'), updateProduct).delete(restrictTo('admin'), deletePhoto, deleteProduct).get(getOneProduct)

