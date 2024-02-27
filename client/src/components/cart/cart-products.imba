tag cart-products
	css
		.container h: 6.5em bdb: 2px solid black d: flex jc: space-around ai: center p: 10px
		.img-box w: 26% w@375: 20% h: 80%
		.content-box w: 65% h: 80% d: flex fld: column
		.box w: 100% h: 50% d: flex jc: space-around ai: center
		.sm-btn-box bd: 1px solid black w: 33% h: 100% d: flex jc: center ai: center


	<self>
		<div.container>
			<div.img-box>
				<img[s: 100%] src="../../../public/image/shirt.jpg">
			<div.content-box>
				<div.box>
					<span[fs: 12px fw: 600]> "Boy's shirt - top quality"
					<img[s: 20px] src="../../../public/svg/trash.svg">
				<div.box>
					<div[ w: 8em h: 65% d: flex jc: space-around ai: center]>
						<div[cursor: pointer] .sm-btn-box>
							<img[s: 15px] src="../../../public/svg/minus.svg">
						<div.sm-btn-box>
							<span[fw: bold fs: 15px]> 3
						<div[cursor: pointer] .sm-btn-box>
							<img[s: 10px] src="../../../public/svg/plus-icon.svg">

					<span[fs: 12px fw: 600]> "$ 12.32"
					