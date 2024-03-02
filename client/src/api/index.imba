import axios from 'axios'

const URL = 'http://localhost:3000'

const AUTH_URL = "{URL}/api/v1/user"
const ORDER_URL = "{URL}/api/v1/order"
const PRODUCT_URL = "{URL}/api/v1/product"

const AUTH_API = axios.create({ baseURL: AUTH_URL });
const ORDER_API = axios.create({ baseURL: ORDER_URL });
const PRODUCT_API = axios.create({ baseURL: PRODUCT_URL });

export const signup = do(signup_details) return AUTH_API.post '/signup', signup_details
export const login = do(login_details) return AUTH_API.post '/login', login_details
export const getMe = do(_token) return AUTH_API.get '/me', headers:
	Authorization: "Bearer {_token}"

export const createProduct = do(_token, product_details) return PRODUCT_API.post '/', product_details, headers:
	Authorization: "Bearer {_token}"

export const getTotalSell = do(_token) return ORDER_API.get '/total-sell', headers:
	Authorization: "Bearer {_token}"

export const getTotalNumberOfListedProduct = do(_token) return PRODUCT_API.get '/total', headers:
	Authorization: "Bearer {_token}"

export const getOrders = do(_token) return ORDER_API.get '/seller', headers:
	Authorization: "Bearer {_token}"

export const getTopSixProducts = do(_token) return PRODUCT_API.get '/top-6-products', headers:
	Authorization: "Bearer {_token}"

export const getAllProducts = do(_token) return PRODUCT_API.get '/', headers:
	Authorization: "Bearer {_token}"

# export const get