import express from 'express'
import { login, signup, getMe } from '../controllers/auth.controller.imba'
import { protect } from '../controllers/auth.controller'

export const router = express.Router!

router.route('/signup').post signup
router.route('/login').post login
router.route('/me').get protect, getMe
