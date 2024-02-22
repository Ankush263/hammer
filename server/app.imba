import express from 'express'
import index from './index.html'
import { router as user_router } from './src/routes/user.router.imba'
import { router as product_router } from './src/routes/product.router'
import { router as cart_router } from './src/routes/cart.router'
import { globalError } from './src/middlewares/globalError'
import cookieParser from 'cookie-parser'
import cors from 'cors';

const app = express!

const jsonBody = express.json({ limit: '1kb' })

app.use cookieParser!
app.use cors!
app.use jsonBody

app.get '/' do(req, res)
	res.send index.body

app.use '/api/v1/user', user_router
app.use '/api/v1/product', product_router
app.use '/api/v1/cart', cart_router

app.use globalError

export default app