import "../../components/header/top-navbar.imba"
import "../../components/header/mid-navbar.imba"
import "../../components/header/bottom-navbar.imba"

tag home

	css
		.home-container bg: #f7d031 h: 120px mt: -5px d: flex fld: column ai: center d@786: none
		.big-btn bd: 2px solid black h: 45px mt: 10px w: 89% d: flex jc: center ai: center bg: white
		span fs: 15px fw: 500
		.small-btn-box mt: 10px h: 45px w: 89% d: flex jc: space-between
		.small-btn-box-top mt: -4.5em w: 100% d: flex jc: center ai: center
		.btn-box w: 50% d: flex jc: space-between
		.btn bd: 2px solid black w: 40% bg: #ffffff d: flex jc: center ai: center h: 45px cursor: pointer
		.top-seller-container mt: 20px mb: 50px d: flex fld: column ai: center
		.top-seller-header-txt fs: 22px fw: 800 mb: 40px mt: 50px

	<self>
		<div>
			<top-navbar>
			<mid-navbar>
			<bottom-navbar>

		<div>
			<img[w: 100%] src="../../../public/image/home-dress.jpg">
			<div.small-btn-box-top[d: none d@786: flex bd: 1px solid blue]>
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

			<img[w: 100% transform: rotate(180deg) d@786: none] src="../../../public/image/wave-bg.png">
			<div.top-seller-container>
				<span.top-seller-header-txt> "Meet Our Top Sellers"
				<div[d: grid gtc: repeat(2, 1fr) gtc@786: repeat(3, 1fr) grid-gap: 25px w: 95% w@786: 60%]>
					<img[w: 100% ] src="../../../public/image/shirt.jpg">
					<img[w: 100% ] src="../../../public/image/shirt.jpg">
					<img[w: 100% ] src="../../../public/image/shirt.jpg">
					<img[w: 100% ] src="../../../public/image/shirt.jpg">
					<img[w: 100% ] src="../../../public/image/shirt.jpg">
					<img[w: 100% ] src="../../../public/image/shirt.jpg">

			