import express from 'express'
import { restrictTo, protect } from '../controllers/auth.controller.imba'
import { addToCart } from '../controllers/cart.controller.imba'

export const router = express.Router!

router.use protect

router.route('/:id').post restrictTo('customer'), addToCart

