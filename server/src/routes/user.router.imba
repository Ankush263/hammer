import express from 'express'
import { login, signup } from '../controllers/auth.controller.imba'

export const router = express.Router!

router.route('/signup').post signup
router.route('/login').post login
