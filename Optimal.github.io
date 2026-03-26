Writing
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Richard | Personal Website</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
    scroll-behavior: smooth;
}

body {
    background: linear-gradient(to right, #1f1f1f, #2c3e50);
    color: white;
}

/* Navigation */
nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 10%;
    background: rgba(0,0,0,0.7);
    position: sticky;
    top: 0;
}

nav h1 {
    font-size: 24px;
    color: #00d4ff;
}

nav ul {
    list-style: none;
    display: flex;
}

nav ul li {
    margin-left: 25px;
}

nav ul li a {
    text-decoration: none;
    color: white;
    transition: 0.3s;
}

nav ul li a:hover {
    color: #00d4ff;
}

/* Hero Section */
.hero {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 80px 10%;
    flex-wrap: wrap;
}

.hero img {
    width: 320px;
    max-width: 100%;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.5);
    transition: 0.4s;
}

.hero img:hover {
    transform: scale(1.05);
}

.hero-text {
    max-width: 500px;
    margin-left: 40px;
}

.hero-text h2 {
    font-size: 36px;
    margin-bottom: 15px;
}

.hero-text span {
    color: #00d4ff;
}

.hero-text p {
    margin-bottom: 20px;
    line-height: 1.6;
}

.btn {
    display: inline-block;
    padding: 12px 25px;
    background: #00d4ff;
    color: black;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: 0.3s;
    border: none;
    cursor: pointer;
}

.btn:hover {
    background: white;
}

/* Quote Section */
.quote {
    padding: 80px 10%;
    text-align: center;
    background: #111;
}

.quote h2 {
    color: #00d4ff;
    margin-bottom: 20px;
}

#quote {
    margin-bottom: 20px;
    font-style: italic;
}

/* About Section */
.about {
    padding: 80px 10%;
    text-align: center;
    background: #1a1a1a;
}

.about h2 {
    margin-bottom: 15px;
    color: #00d4ff;
}

/* Contact Section */
.contact {
    padding: 80px 10%;
    text-align: center;
}

.contact a {
    color: #00d4ff;
    text-decoration: none;
    font-weight: bold;
}

/* Footer */
footer {
    text-align: center;
    padding: 20px;
    background: black;
    font-size: 14px;
}

/* Responsive */
@media (max-width: 768px) {
    nav {
        flex-direction: column;
    }

    nav ul {
        margin-top: 10px;
    }

    .hero {
        flex-direction: column;
        text-align: center;
    }

    .hero-text {
        margin-left: 0;
        margin-top: 20px;
    }
}
</style>
</head>

<body>

<nav>
    <h1>Richard</h1>
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#quote-section">Motivation</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>

<section class="hero">
    <img src="Richard.jpg" alt="Richard">
    <div class="hero-text">
        <h2>Hello, I'm <span>Richard</span></h2>
        <p>
            Welcome to my personal website. I believe in growth, positivity, and building a strong future.
            This space represents my journey and vision.
        </p>
        <a href="#contact" class="btn">Contact Me</a>
    </div>
</section>

<section id="quote-section" class="quote">
    <h2>Daily Motivation</h2>
    <p id="quote">Click the button to get inspired ✨</p>
    <button onclick="getQuote()" class="btn">New Quote</button>
</section>

<section id="about" class="about">
    <h2>About Me</h2>
    <p>
        I am passionate about self-development, creativity, and living life with purpose.
        My goal is to inspire and grow continuously while connecting with like-minded individuals.
    </p>
</section>

<section id="contact" class="contact">
    <h2>Contact</h2>
    <p>Email me at:</p>
    <p>
        <a href="mailto:optimalyoungforever@gmail.com">
            optimalyoungforever@gmail.com
        </a>
    </p>
</section>

<footer>
    <p>© 2026 Richard | All Rights Reserved</p>
</footer>

<script>
async function getQuote() {
    const quoteText = document.getElementById("quote");

    quoteText.innerHTML = "Loading...";

    try {
        let response = await fetch("https://api.quotable.io/random");
        let data = await response.json();

        quoteText.innerHTML = `"${data.content}" <br> — ${data.author}`;
    } catch (error) {
        quoteText.innerHTML = "Failed to load quote. Try again.";
    }
}
</script>

</body>
</html>
