import "../../components/order/order-history.imba"

tag dashboard

	css
		.header h: 50px d: flex jc: center ai: center bg: #f7d031
		.header-txt fs: 1.5em fw: 900 font-style: italic td: none
		.green-box bd: 1px solid black w: 270px h: 130px rd: 7 bg: #43b85c d: flex jc: center ai: center
		.yellow-box bd: 1px solid black w: 270px h: 130px rd: 7 bg: #f7d031 d: flex jc: center ai: center mt: 20px
		.table-head bd: 1px solid black w: 90% w@768: 740px mt: 60px h: 40px d: flex jc: space-around ai: center bg: #f7d031 rd: 5px
		.title fs: 12px fw: 500
		.order-history-box w: 100% w@768: 740px h: 250px mt: 10px mb: 15px d: flex fld: column jc: start ai: center overflow: hidden overflow-y: scroll bg: rgba(225, 225, 225, 0.7)


	<self>
		<nav.header>
			<span.header-txt> "Admin Dashboard"

		<div[d: flex fld: column jc: center ai: center mt: 2em]>
			<div.green-box>
				<span[fs: 16px fw: 600]> "Total Sells: $ 2351.93"

			<div.yellow-box>
				<span[fs: 16px fw: 600]> "Total Listed Product: 34"
			
			<div.table-head>
				<span.title> "Email"
				<span.title> "Created At"
				<span.title> "Amount"
				<span.title> "Total"

			<div.order-history-box>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				<div[w: 90% mt: 10px]>
					<order-history>
				
			<button[w: 90% w@768: 740px bd: 2px solid black h: 40px mb: 40px bg: #f7d031 cursor: pointer]>
				<span[fw: 600 fs: 15px] route-to='/product-upload'> "Upload Product"
				
				