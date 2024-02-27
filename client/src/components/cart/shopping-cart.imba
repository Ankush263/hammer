import { handleCart } from '../../helpers/index.imba' 
import "./cart-products.imba"

tag shopping-cart 

	css
		.container bg: #ffffff mih: 100vh w: 100% maw: 480px pos: fixed right: -0.1 top: 0 z-index: 999999
		.box w: 100% h: 50px d: flex jc: center ai: center
		.header-txt fs: 12px h: 100% fw: 600 tt: capitalize d: flex jc: center ai: center
	
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

			<div[h: 80vh overflow: scroll]>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
				<cart-products>
