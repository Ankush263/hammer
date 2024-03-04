import { handleCart, fetchToken, loadingCart } from '../../helpers/index.imba' 
import { getMyCart } from "../../api/index.imba"
import "./cart-products.imba"

let cart = {}
let items = []

tag shopping-cart 

	@autorun
	def fetch()
		try
			cart = (await getMyCart(fetchToken())).data.data[0]
			items = cart.products
			imba.commit!
		catch error
			console.log error

	css
		.container bg: #ffffff mih: 100vh w: 100% maw: 480px pos: fixed right: -0.1 top: 0 z-index: 999999
		.box w: 100% h: 50px d: flex jc: center ai: center
		.header-txt fs: 12px h: 100% fw: 600 tt: capitalize d: flex jc: center ai: center
		.cart-btn bd: 2px solid black w: 90% h: 45px d: flex jc: center ai: center px: 5px bg: #f7d031
		.link-txt fw: 600 fs: 12px c: black cursor: pointer td: none
	
	<self>
		<div.container>
			<div.box>
				<span[fs: 20px fw: 600 ml: auto]> "Your Cart"
				<img[cursor: pointer s: 20px ml: auto mr: 0.8em] 
						src="../../../public/svg/cross.svg"
						@click=handleCart
					>
			<div[bg: #f7d031 h: 60px]>
				<span.header-txt> "Get 2 shirts with 15% off | use code ANKUSH"

			<div[h: 60vh overflow: scroll]>
				loadingCart and <div[w: 100% h: 100% d: flex jc: center ai: center]>
					<img[s: 50px] src="../../../public/image/loading.webp">
				if items and items.length > 0
					for product in items
						<cart-products fetch=fetch id=product.product._id quantity=product.quantity price=product.total image=product.product.image name=product.product.name>
				elif items and items.length === 0
					<div[h: 450px d: flex fld: column jc: center ai: center ]>
						<span[fw: 700 fs: 25px]> "Your cart is empty!"
						<span[fw: 400 fs: 12px mt: 14px]> "Add your favourite items to your cart."
				else
					<span> "Loading cart items..."

			<div[mb: 5px mt: 15px d: flex fld: column jc: center ai: center]>
				<div[w: 90% d: flex jc: space-between ai: center]>
					<span[fw: 600 fs: 12px]> "Subtotal ({items.length} items):"
					<span[fw: 600 fs: 12px]> "${cart.subTotal}"
				<div.cart-btn>
					<a.link-txt route-to="/checkout" @click=handleCart> "CHECKOUT"
				<div[mt: 10px bgc: white].cart-btn>
					<a.link-txt route-to="/shop" @click=handleCart> "CONTINUE SHOPPING"
