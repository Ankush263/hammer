global css body m: 0 p: 0 font-family: sans-serif

import "./pages/auth/signup.imba"
import "./pages/auth/login.imba"

tag app
	<self>

		<div route='/signup'>
			<signup>

		<div route='/login'>
			<login>

imba.mount <app>

