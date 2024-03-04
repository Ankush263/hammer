import { getMe } from "../api/index.imba"

export let openCart = no
export let showDropdown = yes
export let loadingCart = no

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
		imba.router.url.href = "https://{imba.router.url.host}" + redirect-url

export def checkUser()
	const user = await getMe(fetchToken())
	return user.data.data.role

export def setLoadingCart(val)
	console.log "running...", val
	loadingCart = val
	