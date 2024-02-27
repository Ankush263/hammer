tag all-products

	css
		.top-seller-header fs: 22px fw: 800 mb: 50px mt: 50px d: flex fld: column ai: center
		.sm-img-box d: flex fld: column ai: center rd: 10px
		.desc-text d: flex fld: column mt: 5px
		.desc-txt-title fs: 10px fs@786: 12px fs@1024: 15px fw: 800
		.desc-txt-light fs: 12px fs@1024: 15px mt: 3px fw: 500


	<self>
		<div[w: 100vw d: flex fld: column jc: center ai: center ]>
			<div[w: 90% w@786: 90vw mt: 30px]>
				<span[fs: 15px fw: 500]> "5 Products"

			<div.top-seller-header> 
				<div[d: grid gtc: repeat(2, 1fr) gtc@786: repeat(4, 1fr) grid-gap: 25px w: 100% w@786: 90vw]>

					for i in [0...6]
						<div.sm-img-box route-to="/product/123">
							<img[s: 85% rd: 10px] src="../../../public/image/shirt.jpg">
							<div.desc-text>
								<span.desc-txt-title> "Boy's shirt - top quality"
								<span.desc-txt-light> "$ 13"

		<footer-comp>
