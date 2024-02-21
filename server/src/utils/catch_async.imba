const catchAsync = do(asyncFunction) return do(req, res, next) asyncFunction(req, res, next).catch do(err) next err
module.exports = catchAsync
