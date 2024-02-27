import { handleCart } from '../../helpers/index.imba' 
import "./cart-products.imba"

tag shopping-cart 

	css
		.container bg: #ffffff mih: 100vh w: 100% maw: 480px pos: fixed right: -0.1 top: 0 z-index: 999999
		.box w: 100% h: 50px d: flex jc: center ai: center
		.header-txt fs: 12px h: 100% fw: 600 tt: capitalize d: flex jc: center ai: center
		.cart-btn bd: 2px solid black w: 90% h: 45px d: flex jc: center ai: center px: 5px bg: #f7d031
	
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

			# <div[h: 450px d: flex fld: column jc: center ai: center ]>
			# 	<span[fw: 700 fs: 25px]> "Your cart is empty!"
			# 	<span[fw: 400 fs: 12px mt: 14px]> "Add your favourite items to your cart."

			<div[h: 60vh overflow: scroll]>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>

			<div[mb: 5px mt: 15px d: flex fld: column jc: center ai: center]>
				<div[w: 90% d: flex jc: space-between ai: center]>
					<span[fw: 600 fs: 12px]> "Subtotal (8 items):"
					<span[fw: 600 fs: 12px]> "$234.60"
				<div.cart-btn>
					<span[fw: 600 fs: 12px]> "CHECKOUT"
				<div[mt: 10px bgc: white].cart-btn>
					<a[fw: 600 fs: 12px c: black cursor: pointer td: none] route-to="/shop" @click=handleCart> "CONTINUE SHOPPING"
