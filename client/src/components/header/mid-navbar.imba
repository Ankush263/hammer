let showDropdown = yes

tag mid-navbar


	css
		nav m: 0 p: 0.5em px: 1em bdb: 2px solid black bg: #ffffff px@1024: 100px py@1024: 1em
			div d: flex jc: space-between ai: center w: 100% h: 2em p@1024: 0.5
				span fs: 2em fw: 900 font-style: italic
				.menu-box w: 2.8em display: none display@768: block
				.small-txt fs: 0.6em fs@786: 0.8em fw: 500 font-style: normal mr: 3px td: none c: center
		.search_box bd: 1px solid black mt: 0.8em rd: 5px py: 4px d: flex ai: center jc: center
			input h: 100% w: 90% bd: none outline: none
		.drop-down-box-none display: none
		.drop-down-box bg: #ffffff w: 100% z-index: 9999 position: fixed  
		.options bdb: 2px solid black p: 1em fs: 15px fw: 500


	<self>
		<nav>
			<div>
				if showDropdown
					<img[cursor: pointer s: 20px display@768: none] 
						@click=(showDropdown = !showDropdown) 
						src="../../../public/svg/hamburger-menu.svg"
					>
				else
					<img[cursor: pointer s: 20px display@768: none] 
						@click=(showDropdown = !showDropdown) 
						src="../../../public/svg/cross.svg"
					>
				<span[cursor: pointer]> "hammer"

				<div.menu-box>
					<div[w: 220px d: flex jc: space-between ai: center]>
						<div[w: 30px cursor: pointer]>
							<a.small-txt  route-to='/shop'> "SHOP"
							<img[s:10px] src="../../../public/svg/plus-icon.svg">
						<div[w: 140px cursor: pointer]>
							<span.small-txt> "ADMIN DASHBOARD"
							<img[s:10px] src="../../../public/svg/plus-icon.svg">

				<div[w: 38px w@786: 60px w@1024: 20em d: flex jc: space-between ai: center]>
					<div.search_box[display: none display@1024: flex  w@1024: 250px mt: 0]>
						<img[s:25px ml:0.4em] src="../../../public/svg/search.svg">
						<input type="text" placeholder="Search...">

					<img[d: none s@786: 15px d@786: block cursor: pointer] src="../../../public/svg/usericon.svg">
					<img[s: 38px s@786: 30px cursor: pointer] src="../../../public/svg/shopping-cart.svg">

			<div.search_box[display@1024: none]>
				<img[s:25px ml:0.4em] src="../../../public/svg/search.svg">
				<input type="text" placeholder="Search...">

		<div .drop-down-box=!showDropdown .drop-down-box-none=showDropdown>
			<div[d: flex flex-direction: column]>
				<div.options> 
					<a[td: none c: black] route-to='/shop'> "Shop"
				<div.options> "Cart"
				<div.options> "Profile"
				<div.options> "Admin Dashboard"
				
