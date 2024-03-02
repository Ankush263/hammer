import { getMe } from "../api/index.imba"

export let openCart = no
export let showDropdown = yes

export def handleCart()
	openCart = !openCart
	showDropdown = yes

export def toggleDropDown()
	showDropdown = !showDropdown

export def setDropdown(value)
	showDropdown = value

export def fetchToken()
	const token = localStorage.getItem('Token')
	return JSON.parse(token)..value

export def goto(redirect-url)
	if fetchToken() === "" || fetchToken() === undefined
		imba.router.url.href = "http://{imba.router.url.host}" + redirect-url

export def checkUser()
	const user = await getMe(fetchToken())
	return user.data.data.role
