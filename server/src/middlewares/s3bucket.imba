import uuid from 'uuid/v1'
import multer from 'multer'
import multerS3 from 'multer-s3'
import path from 'path'
import { s3 } from './s3'


const s3Storage = multerS3
	s3: s3
	bucket: "{process.env.BUCKET_NAME}"
	contentType: multerS3.AUTO_CONTENT_TYPE
	metadata: do(req, file, cb) cb null, fieldname: file.fieldname

	key: do(req, file, cb)
		const fileName = 'hammer' + "/" + req.user.id + "/" + uuid() + ".jpeg"
		cb null, fileName


def sanitizeFile(file, cb)
	const fileExts = [
		".png"
		".jpg"
		".jpeg"
	]
	const isAllowedExt = fileExts.includes(path.extname(file.originalname.toLowerCase()))
	const isAllowedMimeType = file.mimetype.startsWith("image/")

	if isAllowedExt and isAllowedMimeType
		return cb(null, true)
	else
		cb "Error: File type not allowed!"


export const uploadImage = multer
	storage: s3Storage
	fileFilter: do(req, file, callback) sanitizeFile file, callback
	limits:
		fileSize: 1024 * 1024 * 2


