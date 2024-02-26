global css body m: 0 p: 0 ff: sans-serif

import "./pages/auth/signup.imba"
import "./pages/auth/login.imba"
import "./pages/main/home.imba"
import "./pages/main/shop.imba"

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

imba.mount <app>

