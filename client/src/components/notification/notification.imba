
export def show-notification(notification, show, message)
	if show
		if notification === 'error'
			<notification color="red" show=show message=message>
		elif notification === 'success'
			<notification color="green" show=show message=message>

			
	else
		return ""


tag notification
	prop show = no
	prop message = ""
	prop color = "black"


	css
		.box-red pos: absolute d: flex jc: space-between ai: center w: 280px p: 10px h: 25px bg: red mt: auto rd: 8px
		.box-green pos: absolute d: flex jc: space-between ai: center w: 280px p: 10px h: 25px bg: green mt: auto rd: 8px

	<self>
		if color === "red" 
			<div.box-red>
				<span[fw: 700 c: white]> message
				<img[s: 20px] @click=(show = !show) src="../../../public/svg/cross.svg">
		else
			<div.box-green>
				<span[fw: 700 c: white]> message
				<img[s: 20px] @click=(show = !show) src="../../../public/svg/cross.svg">


