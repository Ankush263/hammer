tag order-history
	prop name = ""
	prop createdAt = ""
	prop state = "ordered"
	prop total = 0

	css
		span fs: 12px fw: 500

	<self>
		<div[bd: 1px solid black w: 100% h: 40px d: flex jc: space-around ai: center bg: #43b85c rd: 5px]>
			<span> "{name..replace(/@gmail\.com/g, "")}"
			<span> "{createdAt..split("T")[0]}"
			<span> "{state}"
			<span> "$ {total}"