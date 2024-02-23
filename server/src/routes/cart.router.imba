import express from 'express'
import { restrictTo, protect } from '../controllers/auth.controller.imba'
import { 
	addToCart, 
	deleteCart, 
	getMyCart, 
	removeFromCart 
} from '../controllers/cart.controller.imba'

export const router = express.Router!

router.use protect
router.use restrictTo('customer')

router.route('/add').post addToCart
router.route('/remove').post removeFromCart
router.route('/').get getMyCart
router.route('/:id').delete deleteCart
