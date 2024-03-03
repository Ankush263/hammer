import '../../components/products/products-component.imba'
import { getTopSixProducts } from "../../api/index.imba"
import { fetchToken } from "../../helpers/index.imba"

let topProducts = []

tag top-6-product

	@autorun
	def fetch()
		const res = await getTopSixProducts(fetchToken())
		topProducts = res.data.data
		imba.commit!


	css
		.top-seller-header fs: 22px fw: 800 mb: 50px mt: 50px d: flex fld: column ai: center
		.top-seller-header-txt fs: 22px fw: 800 mb: 50px mt: 50px d: flex fld: column ai: center
		.sm-img-box d: flex fld: column ai: center cursor: pointer
		.desc-text d: flex fld: column mt: 5px
		.desc-txt-title fs: 10px fs@768: 12px fs@1024: 15px fw: 800
		.desc-txt-light fs: 12px fs@1024: 15px mt: 3px fw: 500


	<self>
		<div[w: 100vw d: flex jc: center ai: center ]>
			<div.top-seller-header> 
				<span.top-seller-header-txt> "Meet Our Top Sellers"
				<div[d: grid gtc: repeat(2, 1fr) gtc@768: repeat(3, 1fr) grid-gap: 25px w: 100% w@768: 100%]>

					for i in topProducts
						<div.sm-img-box route-to="/product/{i._id}">
							<img[s: 85% rd: 10px] src="{i.image}">
							<div.desc-text>
								<span.desc-txt-title> "{i.name}"
								<span.desc-txt-light> "$ {i.price}"

								