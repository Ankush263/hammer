tag bottom-navbar

	css
		nav m: 0 p: 0.3em px: 1em bdb: 2px solid black bg: #f7d031 py@1024: 1em py@768: 1.5em d: flex jc: center ai: center
		.container d: flex jc: center ai: center w: 73%
		.box h: 20px  d: flex jc: space-between ai: center mr: 0.7em w@768: 115px
		span fs: 9px fw: 600 fs@768: 10px

	<self>
		<nav>
			<div.container>
				<div.box>
					<img[s: 23px s@768: 40px mr: 7px] src="../../../public/svg/exchange.svg">
					<span> "14 Day Easy Exchanges"

				<div.box>
					<img[s: 23px s@768: 40px mr: 7px] src="../../../public/svg/shipping.svg">
					<span> "Fast Shipping & COD"

				<div.box[display: none display@768: flex]>
					<img[s: 23px s@768: 40px mr: 7px] src="../../../public/svg/message.svg">
					<span> "Prompt Support"