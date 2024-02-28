tag product-upload

	css
		.header h: 50px d: flex jc: center ai: center bg: #f7d031
		.header-txt fs: 1.5em fw: 900 font-style: italic td: none
		input mt: 20px w: 85% fs: 16px h: 30px p: 10px 
		textarea mt: 20px w: 85% fs: 16px h: 60px p: 10px 
		.btn w: 90% w@768: 740px bd: 1px solid black h: 45px mb: 40px bg: #43b85c cursor: pointer mt: 20px

	<self>
		<nav.header>
			<span.header-txt> "Upload Product"
		
		<div[d: flex fld: column jc: center ai: center]>
			<input type="text" placeholder="Product name">
			<textarea rows=6 placeholder="Product description">
			<div[d: flex fld: column jc: space-around ai: center h: 160px mt: 20px]>
				<div[bd: 1px solid black bg: rgba(225, 225, 225, 0.3) rd: 10px w: 150px h: 150px d: flex jc: center ai: center]>
					<input[display: none] type="file" id="actual-btn">
					<label htmlFor="actual-btn"> "Choose Image"
			<input type="number" placeholder="Product price">
			<input type="number" placeholder="Product stock">

			<button.btn>
				<span[fw: 600 fs: 15px]> "Add Product"

