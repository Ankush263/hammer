import { addToCart, removeFromCart } from "../../api/index.imba"
import { fetchToken } from "../../helpers/index.imba"

tag cart-products
	prop quantity = 1
	prop image = ""
	prop name = ""
	prop price = 0
	prop id
	prop fetch

	def handleAdd
		const details = {
			productId: id,
		}
		await addToCart fetchToken!, details
		fetch!
		imba.commit!

	def handleSubtract
		const details = {
			productId: id,
		}
		await removeFromCart fetchToken!, details
		fetch!
		imba.commit!

	css
		.container h: 6.5em bdb: 2px solid black d: flex jc: space-around ai: center p: 10px
		.img-box w: 26% w@375: 20% h: 80%
		.content-box w: 65% h: 80% d: flex fld: column
		.box w: 100% h: 50% d: flex jc: space-around ai: center
		.sm-btn-box bd: 1px solid black w: 33% h: 100% d: flex jc: center ai: center


	<self>
		<div.container>
			<div.img-box>
				<img[s: 100%] src="{image}">
			<div.content-box>
				<div.box>
					<span[fs: 12px fw: 600]> "{name}"
					<div[s: 20px]>
				<div.box>
					<div[ w: 8em h: 65% d: flex jc: space-around ai: center]>
						<div[cursor: pointer] .sm-btn-box>
							<img[s: 15px] @click=handleSubtract src="../../../public/svg/minus.svg">
						<div.sm-btn-box>
							<span[fw: bold fs: 15px]> quantity
						<div[cursor: pointer] .sm-btn-box>
							<img[s: 10px] @click=handleAdd src="../../../public/svg/plus-icon.svg">

					<span[fs: 12px fw: 600]> "$ {price}"
					