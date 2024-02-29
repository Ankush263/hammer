import "../../components/header/top-navbar.imba"
import "../../components/header/mid-navbar.imba"
import "../../components/header/bottom-navbar.imba"
import "../../components/footer/footer.imba"
import "../../components/top-products/top-product.imba"

tag five-star
	<self>
		<div[d: flex]>
			for i in [0...5]
				<img[w: 100%] src="../../../public/svg/star-icon.svg">

tag home

	css
		.home-container bg: #f7d031 h: 120px mt: -5px d: flex fld: column ai: center d@768: none
		.big-btn bd: 2px solid black h: 45px mt: 10px w: 89% d: flex jc: center ai: center bg: white
		span fs: 15px fw: 500
		.small-btn-box mt: 10px h: 45px w: 89% d: flex jc: space-between
		.small-btn-box-top mt: -4.5em w: 100% d: flex jc: center ai: center
		.btn-box w: 50% d: flex jc: space-between
		.btn bd: 2px solid black w: 40% bg: #ffffff d: flex jc: center ai: center h: 45px cursor: pointer
		.top-seller-container mt: 20px mb: 60px d: flex fld: column ai: center w: 100vw

		
	<self>
		<div>
			<top-navbar[pos: sticky top: 0 z-index: 9999]>
			<mid-navbar>
			<bottom-navbar>

		<div>
			<img[w: 100%] src="../../../public/image/home-dress.jpg">
			<div.small-btn-box-top[d: none d@768: flex bd: 1px solid blue]>
				<div.btn-box>
					<div.btn>
						<span> "SHOP"
					<div.btn>
						<span> "CART"

			<div.home-container>
				<div.big-btn>
					<span> "START BUSINESS WITH US"
				<div.small-btn-box>
					<div.btn>
						<span> "SHOP"
					<div.btn>
						<span> "CART"

			<img[w: 100% transform: rotate(180deg) d@768: none] src="../../../public/image/wave-bg.png">
			<div.top-seller-container>

				<top-6-product>

				<div[mt: 50px]>
				<img[w: 100%] src="../../../public/svg/wave-green-bg.svg">
				<div[bg: #43b85c w: 100% mt: -1.9px h: 60vw h@528: 40vw h@1024: 30vw d: flex jc: center ai: center]>
					<div[d: flex fld: column jc: center ai: center]>
						<span[fw: 800 fs: 30px fs@1024: 40px]> "Hammer Reviews"
						<span[fw: 800 fs: 30px fs@1024: 40px mt: 10px]> "4.7"
						<five-star[mt: 10px]>
				<img[w: 100% transform: rotate(180deg) mt: -0.6] src="../../../public/svg/wave-green-bg.svg">

			<footer-comp>
				


					
					
			