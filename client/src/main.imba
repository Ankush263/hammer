global css body m: 0 p: 0 ff: sans-serif

import "./pages/auth/signup.imba"
import "./pages/auth/login.imba"
import "./pages/main/home.imba"
import "./pages/main/shop.imba"
import "./pages/main/single-product.imba"
import "./pages/main/checkout.imba"
import "./pages/main/order-success.imba"
import "./pages/admin/dashboard.imba"
import "./pages/admin/upload.imba"
import "./pages/admin/login.imba"
import "./pages/admin/signup.imba"
import "./pages/admin/signup.imba"

tag app
	<self>
		<imba.HashHistory>
			<div route="/">
				<home>

			<div route="/shop">
				<shop>

			<div route='/signup'>
				<signup>

			<div route='/admin-signup'>
				<admin-signup>

			<div route='/login'>
				<login>

			<div route='/admin-login'>
				<admin-login>

			<div route='/admin-signup'>
				<admin-signup>

			<div route='/checkout'>
				<checkout>

			<div route='/order-success'>
				<order-success>

			<div route='/dashboard'>
				<dashboard>

			<div route='/product-upload'>
				<product-upload>

			<div>
				<single-product route='/product/:id'>

imba.mount <app>

