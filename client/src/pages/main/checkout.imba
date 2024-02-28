tag checkout

	css
		.btn-container h: 200px d: flex fld: column jc: space-around ai: center mt: 200px
		.btn bd: 2px solid black h: 50px bg: #f7d031 d: flex jc: center ai: center w: 80% w@530: 430px cursor: pointer px: 1em
		span fs: 15px fw: 700

	<self>
		<div>
			<top-navbar[pos: sticky top: 0 z-index: 9999]>
		
		<div.btn-container>
			<span[fs: 18px]> "Choose your payment method"
			<div.btn>
				<span> "Cash On Delivery "
				<img[s: 30px ml: auto] route-to='/order-success' src="../../../public/svg/right.svg" >

			<div.btn>
				<span> "Credit / Debit Card "
				<img[s: 30px ml: auto] src="../../../public/svg/right.svg" >

