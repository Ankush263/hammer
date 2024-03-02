import { catchAsync } from '../utils/catch_async'
import { AppError } from '../utils/app_error'
import { 
	getAll, 
	getOne, 
	updateOne, 
	deleteOne 
	} from '../middlewares/handleFactory.imba'
import { Product } from '../models/product.model'
import { User } from '../models/user.model'
import { uploadImage } from '../middlewares/s3bucket'
import { s3 } from '../middlewares/s3'


export const uploadImg = uploadImage.single('image')

export const createProduct = catchAsync do(req, res, next)
	const userProfile = await User.findById req.user.id
	if !userProfile
		return next(new AppError("Please create an account", 404))

	if !req.body.user
		req.body.user = userProfile

	const key = req.file.key
	const url = "https://{process.env.BUCKET_NAME}.s3.amazonaws.com/{key}"

	const doc = await Product.create {
		...req.body
		image: url
	}
	res.status(201).json
		status: "success"
		data: doc


export const getAllProducts = getAll Product

export const getOneProduct = getOne Product, ''

export const updateProduct = updateOne Product

export const deletePhoto = catchAsync do(req, res, next)
	const product = await Product.findById req.params.id
	const parts = product.image.split("https://{process.env.BUCKET_NAME}.s3.amazonaws.com/")
	console.log('parts: ', parts)
	const key = parts[1]
	console.log('key: ', key)

	const params = 
		Bucket: "{process.env.BUCKET_NAME}"
		Key: key

	s3.deleteObject(params) do(err, data)
		if err
			console.log err
		else
			console.log data

	next!


export const deleteProduct = deleteOne Product


export const aliasTopProducts = do(req, res, next)
	req.query.limit = '6'
	req.query.sort = '-totalOrdered';
	req.query.fields = 'name,price,image'
	next!

export const totalListedProduct = catchAsync do(req, res, next)
	const product = await Product.find({user: req.user.id})

	res.status(200).json(
		status: 'success'
		result: product.length
		data: product
	)

export const totalNumberOfListedProduct = catchAsync do(req, res, next)
	const product = await Product.find({user: req.user.id})

	res.status(200).json(
		status: 'success'
		data: product.length
	)

