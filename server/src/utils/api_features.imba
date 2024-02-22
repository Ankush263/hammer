export class APIFeatures

	constructor query, queryString

		query = query
		queryString = queryString


	def filter
		const queryObj = { ...queryString }
		const excludeFields = [
			"page"
			"sort"
			"limit"
			"fields"
		]
		excludeFields.forEach do(el) delete queryObj[el]

		let queryStr = JSON.stringify(queryObj)
		queryStr = queryStr.replace(/\b(gte|gt|lte|lt)\b/g) do(match) "${match}"
		query = query.find(JSON.parse(queryStr))
		this


	def sort
		if queryString.sort
			const sortBy = queryString.sort.split(",").join(" ")
			query = query.sort(sortBy)
		else
			query = query.sort("-createdAt")
		this
		

	def limitFields
		if queryString.fields
			const fields = queryString.fields.split(",").join(" ")
			query = query.select(fields)
		else
			query = query.select("-__v")
		this

