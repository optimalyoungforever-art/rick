<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Richard | Personal Portfolio</title>
    <style>
        :root {
            --primary: #00d4ff;
            --bg-dark: #121212;
            --bg-accent: #1e1e1e;
            --text-light: #ffffff;
            --transition: 0.3s ease;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        html { scroll-behavior: smooth; }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg-dark);
            color: var(--text-light);
            line-height: 1.6;
        }

        /* Navbar */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.2rem 10%;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav h1 { color: var(--primary); font-size: 1.5rem; }

        nav ul { display: flex; list-style: none; gap: 2rem; }

        nav a { text-decoration: none; color: white; transition: var(--transition); font-weight: 500; }

        nav a:hover { color: var(--primary); }

        /* Sections */
        section { padding: 100px 10%; }

        .hero {
            display: flex;
            align-items: center;
            gap: 50px;
            min-height: 80vh;
        }

        .hero-img {
            flex: 1;
            max-width: 400px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
            transition: var(--transition);
        }

        .hero-img:hover { transform: translateY(-10px); }

        .hero-text { flex: 1; }

        .hero-text h2 { font-size: 3rem; margin-bottom: 1rem; }

        .hero-text span { color: var(--primary); }

        /* Reusable Button */
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: var(--primary);
            color: #000;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: var(--transition);
            border: none;
            cursor: pointer;
        }

        .btn:hover { background: white; transform: scale(1.05); }

        /* Motivation Section */
        .quote-box {
            background: var(--bg-accent);
            padding: 50px;
            border-radius: 20px;
            text-align: center;
            border: 1px solid #333;
        }

        #quote { font-size: 1.2rem; font-style: italic; margin: 20px 0; color: #ccc; }

        /* Footer */
        footer { padding: 40px; text-align: center; background: #000; color: #666; font-size: 0.9rem; }

        /* Responsive */
        @media (max-width: 900px) {
            .hero { flex-direction: column; text-align: center; padding-top: 50px; }
            nav ul { display: none; } /* Consider a mobile menu later */
        }
    </style>
</head>
<body>

<nav>
    <h1>Richard.</h1>
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#motivation">Motivation</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>

<section class="hero">
    <img src="Richard.jpg" alt="Richard" class="hero-img">
    <div class="hero-text">
        <h2>Hello, I'm <span>Richard</span></h2>
        <p>I believe in growth, positivity, and building a strong future. This space represents my journey and vision for 2026 and beyond.</p>
        <br>
        <a href="#contact" class="btn">Get in Touch</a>
    </div>
</section>

<section id="motivation">
    <div class="quote-box">
        <h2 style="color: var(--primary)">Daily Motivation</h2>
        <p id="quote">"The only way to do great work is to love what you do."</p>
        <button onclick="getQuote()" class="btn">New Inspiration</button>
    </div>
</section>

<section id="about" style="background: var(--bg-accent); text-align: center;">
    <h2>About My Vision</h2>
    <p style="max-width: 700px; margin: 20px auto;">I am passionate about self-development and creativity. My goal is to build digital solutions that inspire others to live with purpose.</p>
</section>

<section id="contact" style="text-align: center;">
    <h2>Let's Connect</h2>
    <p>Reach out for collaborations or just a chat:</p>
    <br>
    <a href="mailto:optimalyoungforever@gmail.com" style="color: var(--primary); font-size: 1.2rem; text-decoration: none;">optimalyoungforever@gmail.com</a>
</section>

<footer>
    <p>&copy; 2026 Richard | Built for the Future</p>
</footer>

<script>
async function getQuote() {
    const quoteEl = document.getElementById("quote");
    quoteEl.innerText = "Finding inspiration...";
    
    try {
        // Using an alternative reliable API for 2026
        const response = await fetch("https://api.allorigins.win/get?url=" + encodeURIComponent("https://zenquotes.io/api/random"));
        const data = await response.json();
        const quoteData = JSON.parse(data.contents)[0];
        
        quoteEl.innerHTML = `"${quoteData.q}" <br><small>— ${quoteData.a}</small>`;
    } catch (err) {
        quoteEl.innerText = "Stay positive, work hard, and make it happen!";
    }
}
</script>

</body>
</html>
