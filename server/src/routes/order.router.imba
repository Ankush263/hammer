import express from 'express'
import { restrictTo, protect } from '../controllers/auth.controller.imba'
import { 
	createOrder, 
	deleteOrder, 
	getOrdersForSellers, 
	getOrdersForCustomer,
	getTotalSell,
	getSevenDaysStat
} from '../controllers/order.controller'

export const router = express.Router!

router.use protect

router.route('/seller').get restrictTo('admin'), getOrdersForSellers
router.route('/customer').get restrictTo('customer'), getOrdersForCustomer
router.route('/total-sell').get restrictTo('admin'), getTotalSell
router.route('/7-days-stat').get restrictTo('admin'), getSevenDaysStat
router.route('/').post restrictTo('customer'), createOrder
router.route('/:id').delete restrictTo('customer'), deleteOrder

