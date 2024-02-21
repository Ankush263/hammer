import express from 'express'
import index from './index.html'
import router from './src/routes/user.router.imba'
import cors from 'cors';

const app = express!

const jsonBody = express.json({ limit: '1kb' })

app.use cors!
app.use jsonBody

app.get '/' do(req, res)
	res.send index.body

app.use '/api/v1/user', router

export default app