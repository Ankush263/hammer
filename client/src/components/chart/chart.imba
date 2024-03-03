import { get7DaysStat } from "../../api/index.imba"
import { fetchToken } from "../../helpers/index.imba"

let stat = []
let maxVal = 0
let yAxis = []

tag chart
	
	@autorun
	def fetch()
		try
			const sevenDaysStat = await get7DaysStat(fetchToken())
			stat = sevenDaysStat.data.data
			for s in stat
				if s.totalAmount > maxVal
					maxVal = s.totalAmount

			calculeteYAxis(maxVal)
			imba.commit!
		catch error
			console.log error

	def calculeteYAxis(maxValue)
		yAxis = []
		const d = maxValue / 7
		for i in [0...maxValue + 7]
			yAxis.push Math.floor(i)
			i += d
		yAxis = yAxis.reverse!

	def calculateStats(value)
		return Math.floor((value / (maxVal + 6)) * 100)


	css
		.chart-border w: 100% h: 80% bdl: 2px solid black bdb: 2px solid black d: flex jc: start ai: center
		.cols h: 100% w: 10.28% bg: rgba(225, 225, 225, 0.7) d: flex fld: column jc: flex-end mr: 5.28% ml: 2px
		span fs: 12px fw: 700
	

	<self>
		<div[w: 100% h: 100% d: flex ]>
			<div[h: 80% w: 20px d: flex fld: column jc: space-around ai: center]>
				for num in yAxis
					<span> "{num}-"
				

			<div[w: 100% h: 100% d: flex fld: column]>
				<div.chart-border>
					for val in stat
						let percent = calculateStats(val.totalAmount)
						<div.cols>
							<div[h: {percent}% bg: #f7d031 ]>

					
				<div[h: 30px w: 100% d: flex jc: start ai: start]>
					for date in stat
						<span[transform: rotate(45deg) w: 70px mt: 20px]> "{date._id}"
	
					