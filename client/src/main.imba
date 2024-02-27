global css body m: 0 p: 0 ff: sans-serif

import "./pages/auth/signup.imba"
import "./pages/auth/login.imba"
import "./pages/main/home.imba"
import "./pages/main/shop.imba"
import "./pages/main/single-product.imba"

tag app
	<self>
		<div route="/">
			<home>

		<div route="/shop">
			<shop>

		<div route='/signup'>
			<signup>

		<div route='/login'>
			<login>

		<div route='/product/:id'>
			<single-product>

imba.mount <app>

