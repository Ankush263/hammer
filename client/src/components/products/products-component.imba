import { getAllProducts } from "../../api/index.imba"
import { fetchToken } from "../../helpers/index.imba"

let allProducts = []

tag all-products

	@autorun
	def fetch()
		const res = await getAllProducts fetchToken()
		allProducts = res.data.data
		imba.commit!

	css
		.top-seller-header fs: 22px fw: 800 mb: 50px mt: 50px d: flex fld: column ai: center
		.sm-img-box d: flex fld: column ai: center rd: 10px
		.desc-text d: flex fld: column mt: 5px
		.desc-txt-title fs: 10px fs@768: 12px fs@1024: 15px fw: 800
		.desc-txt-light fs: 12px fs@1024: 15px mt: 3px fw: 500


	<self>
		<div[w: 100vw d: flex fld: column jc: center ai: center ]>
			<div[w: 90% w@768: 90vw mt: 30px]>
				<span[fs: 15px fw: 500]> "{allProducts.length} Products"

			<div.top-seller-header> 
				<div[d: grid gtc: repeat(2, 1fr) gtc@768: repeat(4, 1fr) grid-gap: 25px w: 100% w@768: 90vw]>

					for i in allProducts
						<div.sm-img-box route-to="/product/{i._id}">
							<img[s: 85% rd: 10px] src="{i.image}">
							<div.desc-text>
								<span.desc-txt-title> "{i.name}"
								<span.desc-txt-light> "$ {i.price}"

		<footer-comp>
