import "../../components/order/order-history.imba"
import "../../components/chart/chart.imba"
import { checkUser, fetchToken } from "../../helpers/index.imba"
import { 
	getTotalSell, 
	getTotalNumberOfListedProduct, 
	getOrders
} from "../../api/index.imba"

let orderData = []
let totalSell = 0
let totalProduct = 0

tag dashboard

	@autorun 
	def fetch()
		try
			const myRole = await checkUser!
			if myRole !== "admin"
				window.location.replace("https://{imba.router.url.host}/admin-login")
			else
				const sell = await getTotalSell(fetchToken())
				const total = await getTotalNumberOfListedProduct(fetchToken())
				const orders = await getOrders(fetchToken())

				totalSell = sell.data.data
				totalProduct = total.data.data
				orderData = orders.data.data
				imba.commit!
		catch error
			console.log error
			

	css
		.header h: 50px d: flex jc: center ai: center bg: #f7d031 w: 100vw
		.header-txt fs: 1.5em fw: 900 font-style: italic td: none
		.green-box bd: 1px solid black w: 270px h: 130px rd: 7 bg: #43b85c d: flex jc: center ai: center
		.yellow-box bd: 1px solid black w: 270px h: 130px rd: 7 bg: #f7d031 d: flex jc: center ai: center mt: 20px
		.table-head bd: 1px solid black w: 90% w@768: 740px mt: 60px h: 40px d: flex jc: space-around ai: center bg: #f7d031 rd: 5px
		.title fs: 12px fw: 500
		.order-history-box w: 100% w@768: 740px h: 250px mt: 10px mb: 15px d: flex fld: column jc: start ai: center overflow: hidden overflow-y: scroll bg: rgba(225, 225, 225, 0.7)
		.container d: flex fld: column jc: center ai: center mt: 2em
		.top-container w: 100vw w@768: 750px d: flex fld: column fld@768: row jc: center jc@768: space-around ai: center
		.chart-box w: 95% w@500: 470px w@768: 430px h: 300px h@768: 450px d: flex jc: center ai: center mb: 20px mb@768: 0px
		button w: 90% w@768: 740px bd: 2px solid black h: 40px mb: 40px bg: #f7d031 cursor: pointer


	<self>
		<nav.header>
			<span.header-txt> "Admin Dashboard"

		<div.container>

			<div.top-container>

				<div.chart-box>
					<chart[w: 100% h: 100%]>

				<div[d: flex fld: column]>
					<div.green-box>
						<span[fs: 16px fw: 600]> "Total Sells: $ {totalSell}"

					<div.yellow-box>
						<span[fs: 16px fw: 600]> "Total Listed Product: {totalProduct}"

			
			<div.table-head>
				<span.title> "Email"
				<span.title> "Created At"
				<span.title> "State"
				<span.title> "Total"

			<div.order-history-box>
				for order in orderData
					<div[w: 90% mt: 10px]>
						<order-history name=order.seller.email total=order.subTotal state=order.orderState createdAt=order.createdAt >

				
			<button>
				<span[fw: 600 fs: 15px] route-to='/product-upload'> "Upload Product"

			
				
