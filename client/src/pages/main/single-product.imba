tag single-product

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
			<img[s: 100% s@540: 400px] src="../../../public/image/shirt.jpg">

			<div.box>
		
				<div[w: 90% d: flex fld: column py: 1em]>
					<span[fs: 15px fs@1024: 25px fw: 800]> "Boy's shirt - top quality"
					<span[fs: 12px fs@1024: 18px fw: 600 mt: 7px]> "Free Download History 76 SVG vector file in monocolor and multicolor type for Sketch and Figma from History 76 Vectors svg vector collection. History 76 Vectors SVG vector illustration" 
					<span[fs: 12px fw: 800 mt: 5px]> "$ 15.32"
				
				<div.btn>
					<img[s: 15px] src="../../../public/svg/minus.svg">
					<span[fw: 700 fs: 18px]> "1"
					<img[s: 15px] src="../../../public/svg/plus-icon.svg">

				<div.cart-btn>
					<span[fw: 700 fs: 20px]> "Add To Cart"

