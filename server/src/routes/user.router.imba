import express from 'express'
import create_user from '../controllers/user.controller.imba'

const router = express.Router!

router.route('/').get create_user

export default router