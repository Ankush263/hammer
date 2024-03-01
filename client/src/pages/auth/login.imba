import { login } from '../../api/index.imba'
import { show-notification } from "../../components/notification/notification.imba"

let successNotification = no
let errorNotification = no
let startLoading = no

tag login

	def handleCreate
		startLoading = yes
		try 
			const response = await login({
				email: email,
				password: password,
			})

			successNotification = yes
			const token = response..data..token
			const expire = new Date!.getTime! + 1296000000
			typeof token !== "undefined" and window.localStorage.setItem("Token", JSON.stringify value: "{token}", expires: expire)
			
			startLoading = no
			window.location.replace('/')
			setTimeout(&, 1000) do successNotification = no
		catch error
			errorNotification = yes
			startLoading = no
			console.log(error)
			setTimeout(&, 1000) do errorNotification = no

	css 
		nav m: 0 p: 0 height: 4.5em bdb: 2px solid black bg: #f7d031
		section display: flex flex-direction: column justify-content: center align-items: center mt: 40px
		.header-txt font-size: 40px font-weight: 700
		.login-box w@320: 300px w@768: 500px display: flex flex-direction: column
		.input-box display: flex flex-direction: column mt: 9
		label font-size: 20px mb: 5px
		input p: 10px font-size: 15px bd: 2px solid black
		.btn w:100% mt: 10 display: flex justify-content: center
		button font-size: 16px font-weight: 600 padding: 10px w: 100% bg: black color: white cursor: pointer
		.bottom-txt mt: 5 cursor: pointer font-size: 18px text-decoration: none color: black

	<self>
		<nav> 
			<div>
		<section>
			<span.header-txt> "Login"
			<div.login-box>

				<div.input-box>
					<label> "Email:"
					<input type="email" bind=email placeholder="Enter Email" />

				<div.input-box>
					<label> "Password:"
					<input type="password" bind=password placeholder="Enter Password" />

				<div.btn>
					<button @click=handleCreate> 
						!startLoading ? <span> "Log In" : <img[s: 25px] src="../../../public/image/loading.webp">

				<a.bottom-txt route-to='/signup'> "Create account"

				if errorNotification  
					show-notification('error', errorNotification, "Error while login")
				else 
					show-notification('success', successNotification, "You have successfully logged in")
				
