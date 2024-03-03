import axios from 'axios'

# const URL = 'http://localhost:3000'
const URL = 'https://hammer-wzda.onrender.com'

const AUTH_URL = "{URL}/api/v1/user"
const ORDER_URL = "{URL}/api/v1/order"
const PRODUCT_URL = "{URL}/api/v1/product"
const CART_URL = "{URL}/api/v1/cart"

const AUTH_API = axios.create({ baseURL: AUTH_URL });
const ORDER_API = axios.create({ baseURL: ORDER_URL });
const PRODUCT_API = axios.create({ baseURL: PRODUCT_URL });
const CART_API = axios.create({ baseURL: CART_URL });

export const signup = do(signup_details) return AUTH_API.post '/signup', signup_details
export const login = do(login_details) return AUTH_API.post '/login', login_details
export const getMe = do(_token) return AUTH_API.get '/me', headers:
	Authorization: "Bearer {_token}"

export const createProduct = do(_token, product_details) return PRODUCT_API.post '/', product_details, headers:
	Authorization: "Bearer {_token}"

export const getTotalSell = do(_token) return ORDER_API.get '/total-sell', headers:
	Authorization: "Bearer {_token}"

export const createOrder = do(_token, order_details) return ORDER_API.post '/', order_details, headers:
	Authorization: "Bearer {_token}"

export const getTotalNumberOfListedProduct = do(_token) return PRODUCT_API.get '/total', headers:
	Authorization: "Bearer {_token}"

export const getOrders = do(_token) return ORDER_API.get '/seller', headers:
	Authorization: "Bearer {_token}"

export const getTopSixProducts = do(_token) return PRODUCT_API.get '/top-6-products', headers:
	Authorization: "Bearer {_token}"

export const getAllProducts = do(_token) return PRODUCT_API.get '/', headers:
	Authorization: "Bearer {_token}"

export const get7DaysStat = do(_token) return ORDER_API.get '/7-days-stat', headers:
	Authorization: "Bearer {_token}"

export const getSingleProduct = do(_token, _id) return PRODUCT_API.get "/{_id}", headers:
	Authorization: "Bearer {_token}"

export const addToCart = do(_token, _details) return CART_API.post "/add", _details, headers:
	Authorization: "Bearer {_token}"

export const removeFromCart = do(_token, _details) return CART_API.post "/remove", _details, headers:
	Authorization: "Bearer {_token}"

export const getMyCart = do(_token) return CART_API.get "/", headers:
	Authorization: "Bearer {_token}"

	