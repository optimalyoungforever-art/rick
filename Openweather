<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>7-Day Weather Forecast</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        text-align: center;
        padding: 40px;
        color: white;
    }

    input {
        padding: 10px;
        width: 250px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
    }

    button {
        padding: 10px 15px;
        border: none;
        background: #222;
        color: white;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background: #444;
    }

    .weather-box {
        margin-top: 20px;
        padding: 20px;
        background: rgba(0,0,0,0.3);
        border-radius: 10px;
        display: inline-block;
        min-width: 300px;
    }

    .forecast-container {
        margin-top: 20px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 10px;
    }

    .card {
        background: rgba(0,0,0,0.4);
        padding: 10px;
        border-radius: 10px;
        width: 140px;
    }
</style>
</head>

<body>

<h1>🌤️ 7-Day Weather Forecast</h1>

<input type="text" id="city" placeholder="Enter city name">
<button onclick="getWeather()">Search</button>

<div class="weather-box" id="current"></div>
<div class="forecast-container" id="forecast"></div>

<script>
async function getWeather() {
    const city = document.getElementById("city").value.trim();

    if (!city) {
        alert("Please enter a city");
        return;
    }

    try {
        const res = await fetch(`https://wttr.in/${city}?format=j1`);
        const data = await res.json();

        const current = data.current_condition[0];

        // CURRENT WEATHER
        document.getElementById("current").innerHTML = `
            <h2>${city}</h2>
            <p>🌡️ ${current.temp_C}°C</p>
            <p>🌤️ ${current.weatherDesc[0].value}</p>
            <p>💧 Humidity: ${current.humidity}%</p>
            <p>🌬️ Wind: ${current.windspeedKmph} km/h</p>
        `;

        // WEEK DAYS
        const weekDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
        const todayIndex = new Date().getDay();

        // 7 DAY FORECAST
        const forecastDays = data.weather.slice(0, 7);

        let html = "";

        forecastDays.forEach((day, index) => {

            let label;
            if (index === 0) label = "Today";
            else if (index === 1) label = "Tomorrow";
            else label = weekDays[(todayIndex + index) % 7];

            html += `
                <div class="card">
                    <h4>${label}</h4>
                    <p>🌡️ Max: ${day.maxtempC}°C</p>
                    <p>🌡️ Min: ${day.mintempC}°C</p>
                    <p>🌤️ ${day.hourly[0].weatherDesc[0].value}</p>
                </div>
            `;
        });

        document.getElementById("forecast").innerHTML = html;

    } catch (error) {
        document.getElementById("current").innerHTML = "Error loading weather";
        document.getElementById("forecast").innerHTML = "";
    }
}
</script>

</body>
</html>
