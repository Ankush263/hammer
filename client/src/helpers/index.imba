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