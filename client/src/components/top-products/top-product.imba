tag top-6-product

	css
		.top-seller-header fs: 22px fw: 800 mb: 50px mt: 50px d: flex fld: column ai: center
		.top-seller-header-txt fs: 22px fw: 800 mb: 50px mt: 50px d: flex fld: column ai: center
		.sm-img-box d: flex fld: column ai: center 
		.desc-text d: flex fld: column mt: 5px
		.desc-txt-title fs: 10px fs@786: 12px fs@1024: 15px fw: 800
		.desc-txt-light fs: 12px fs@1024: 15px mt: 3px fw: 500


	<self>
		<div[w: 100vw d: flex jc: center ai: center ]>
			<div.top-seller-header> 
				<span.top-seller-header-txt> "Meet Our Top Sellers"
				<div[d: grid gtc: repeat(2, 1fr) gtc@786: repeat(3, 1fr) grid-gap: 25px w: 100% w@786: 100%]>

					for i in [0...6]
						<div.sm-img-box>
							<img[s: 75%] src="../../../public/image/shirt.jpg">
							<div.desc-text>
								<span.desc-txt-title> "Boy's shirt - top quality"
								<span.desc-txt-light> "$ 13"

								