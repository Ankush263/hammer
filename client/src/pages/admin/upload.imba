import { fetchToken } from "../../helpers/index.imba"
import { createProduct } from "../../api/index.imba"
import { show-notification } from "../../components/notification/notification.imba"

let successNotification = no
let errorNotification = no
let startLoading = no
let imgData
let imgURL

tag product-upload

	def handleAddProduct
		startLoading = yes
		try
			const formdata = new FormData!
			formdata.append 'name', name
			formdata.append 'description', description
			formdata.append 'image', imgURL
			formdata.append 'price', price
			formdata.append 'stock', stock

			await createProduct(fetchToken(), formdata)
			successNotification = yes
			startLoading = no

			setTimeout(&, 1000) do successNotification = no
			window.location.reload()
		catch error
			startLoading = no
			errorNotification = yes
			console.log(error)
			setTimeout(&, 1000) do errorNotification = no


	handleChange = do(e)
		const file = e.target.files and e.target.files[0]
		imgURL = file
		if file
			const reader = new FileReader
			reader.onload = do(e2)
				if e2.target
					imgData = e2.target.result
			reader.readAsDataURL file

	css
		.header h: 50px d: flex jc: center ai: center bg: #f7d031
		.header-txt fs: 1.5em fw: 900 font-style: italic td: none
		input mt: 20px w: 85% fs: 16px h: 30px p: 10px 
		textarea mt: 20px w: 85% fs: 16px h: 60px p: 10px 
		.btn w: 90% w@768: 740px bd: 1px solid black h: 45px mb: 40px bg: #43b85c cursor: pointer mt: 20px

	<self>
		<nav.header>
			<span.header-txt> "Upload Product"

		<div[d: flex jc: center ai: center w: 100vw]>
		
			<div[d: flex fld: column jc: center ai: center w: 97% w@768: 700px]>
				<input type="text" bind=name placeholder="Product name">
				<textarea rows=6 bind=description placeholder="Product description">

				<div[d: flex fld: column jc: space-around ai: center h: 160px mt: 20px]>
					<div[bd: 1px solid black bg: rgba(225, 225, 225, 0.3) rd: 10px w: 150px h: 150px d: flex jc: center ai: center]>

						<input[display: none] bind=image @change=handleChange(e) type="file" accept="image/*" id="imgInpt">
						
						if image
							imba.commit! and <img[w: 100% h: 100%] src=(imgData) >
						else
							<label htmlFor="imgInpt"> "Choose Image"

				<input type="number" bind=price placeholder="Product price">
				<input type="number" bind=stock placeholder="Product stock">

				<button.btn>
					!startLoading ? <span[fw: 600 fs: 15px] @click=handleAddProduct> "Add Product" : <img[s: 25px] src="../../../public/image/loading.webp">

					if errorNotification  
						show-notification('error', errorNotification, "Error while product upload")
					else 
						show-notification('success', successNotification, "You have successfully upload a product")

