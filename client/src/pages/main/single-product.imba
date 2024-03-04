import { getSingleProduct, addToCart } from "../../api/index.imba"
import { fetchToken, handleCart } from "../../helpers/index.imba"

let amount = 1
let startLoading = no

tag single-product

	def routed params, state
		data = state.product ||= (await getSingleProduct(fetchToken!, params.id)).data.data

	def handleAddToCart
		try
			startLoading = yes
			const details = 
				productId: data._id
				quantity: amount

			await addToCart fetchToken!, details

			startLoading = no
			handleCart!

		catch error
			startLoading = no
			console.log error
			if error.response.data.message[0] === "You don't have permission to perform this action"
				window.location.replace("https://{imba.router.url.host}/login")

	def handleAdd
		amount++

	def handleSubtract
		amount--

	css
		.btn bd: 2px solid black w: 90% h: 45px d: flex jc: space-between ai: center px: 5px
		.cart-btn bd: 2px solid black w: 90% h: 45px d: flex jc: center ai: center px: 5px mt: 20px bg: #f7d031
		.container d: flex fld: column fld@540: row jc: center ai: center ai@1024: space-between mb: 50px py@540: 50px
		.box w: 100% w@1024: 40em d: flex fld: column jc: center ai: center


	<self>
		<div>
			<top-navbar[pos: sticky top: 0 z-index: 9999]>
			<mid-navbar>
			<bottom-navbar>
		
		<div.container>
			<img[s: 100% s@540: 400px] src="{data.image}">

			<div.box>
		
				<div[w: 90% d: flex fld: column py: 1em]>
					<span[fs: 15px fs@1024: 25px fw: 800]> "{data.name}"
					<span[fs: 12px fs@1024: 18px fw: 600 mt: 7px]> "{data.description}" 
					<span[fs: 12px fw: 800 mt: 5px]> "$ {data.price}"
				
				<div.btn>
					<img[s: 15px] @click=handleSubtract src="../../../public/svg/minus.svg">
					<span[fw: 700 fs: 18px]> "{amount}"
					<img[s: 15px] @click=handleAdd src="../../../public/svg/plus-icon.svg">

				<div.cart-btn>
					!startLoading ? <span[fw: 700 fs: 20px cursor: pointer] @click=handleAddToCart> "Add To Cart" : <img[s: 25px] src="../../../public/image/loading.webp">

