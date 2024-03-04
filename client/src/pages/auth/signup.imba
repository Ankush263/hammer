import { signup } from '../../api/index.imba'
import { show-notification } from "../../components/notification/notification.imba"

let successNotification = no
let errorNotification = no
let startLoading = no

tag signup

	def handleCreate
		startLoading = yes
		try 
			setTimeout(&, 5000) do window.alert("Since this application deployed on a free service, it might take 2 - 4 mins to fetch the data. sit back and relax☺️☺️")
			const response = await signup({
				firstName: firstName,
				lastName: lastName,
				email: email,
				password: password,
			})

			successNotification = yes
			const token = response..data..token
			const expire = new Date!.getTime! + 1296000000
			typeof token !== "undefined" and window.localStorage.setItem("Token", JSON.stringify value: "{token}", expires: expire)
			window.location.replace('/')
			setTimeout(&, 1000) do successNotification = no

		catch error
			errorNotification = yes
			console.log(error)
			setTimeout(&, 1000) do errorNotification = no
		

	css 
		nav m: 0 p: 0 height: 4.5em bdb: 2px solid black bg: #f7d031
		section display: flex flex-direction: column justify-content: center align-items: center mt: 40px
		.header-txt font-size: 40px font-weight: 700
		.signup-box w@320: 300px w@768: 500px display: flex flex-direction: column mb: 20 
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
			<span.header-txt> "Create Customer Account"
			<div.signup-box>
				<div.input-box>
					<label> "First Name:"
					<input type="text" bind=firstName placeholder="Enter First Name" />

				<div.input-box>
					<label> "Last Name:"
					<input type="text" bind=lastName placeholder="Enter Last Name" />

				<div.input-box>
					<label> "Email:"
					<input type="email" bind=email placeholder="Enter Email" />

				<div.input-box>
					<label> "Password:"
					<input type="password" bind=password placeholder="Enter Password" />

				<div.btn>
					<button @click=handleCreate> 
						!startLoading ? <span> "Create" : <img[s: 25px] src="../../../public/image/loading.webp">

				<a.bottom-txt route-to='/login'> "Login to your account"

				if errorNotification  
					show-notification('error', errorNotification, "Error while sign up")
				else 
					show-notification('success', successNotification, "You have successfully signed up")
				

