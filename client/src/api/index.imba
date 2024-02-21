import axios from 'axios'

const URL = 'http://localhost:3000'

const AUTH_URL = "{URL}/api/v1/user"

const AUTH_API = axios.create({ baseURL: AUTH_URL });

export const signup = do(signup_details) return AUTH_API.post '/signup', signup_details
export const login = do(login_details) return AUTH_API.post '/login', login_details
