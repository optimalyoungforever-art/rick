
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Richard Rich | Developer Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #00b894;
            --dark: #121212;
            --light: #ffffff;
            --gray: #f4f4f4;
            --card-bg: #1a1a1a;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
        body { background: var(--dark); color: var(--light); line-height: 1.6; scroll-behavior: smooth; }
        
        /* Navigation */
        nav { 
            background: rgba(18, 18, 18, 0.95); 
            padding: 20px 8%; 
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            position: fixed; 
            width: 100%; 
            top: 0; 
            z-index: 1000; 
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        nav h2 { font-size: 1.2rem; font-weight: 700; letter-spacing: 1px; color: var(--primary); }
        
        .nav-links { display: flex; list-style: none; gap: 24px; align-items: center; }
        .nav-links a { color: var(--light); text-decoration: none; font-size: 0.9rem; transition: color 0.3s; }
        .nav-links a:hover { color: var(--primary); }
        .email-link { font-size: 0.85rem; color: #a0a0a0; }

        /* Hero Section */
        .hero { 
            min-height: 100vh; 
            background: linear-gradient(135deg, #1f4037, #121212); 
            display: flex; 
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
            color: white; 
            text-align: center; 
            padding: 120px 20px 60px 20px;
        }

        #profile-img {
            width: 180px; 
            height: 180px;
            border-radius: 50%;
            border: 4px solid var(--primary);
            margin-bottom: 24px;
            object-fit: cover;
            box-shadow: 0 10px 30px rgba(0, 184, 148, 0.3);
            display: block;
        }

        #github-name { font-size: 2.5rem; margin-bottom: 8px; font-weight: 700; }
        #github-bio { font-size: 1.1rem; max-width: 500px; color: #a0a0a0; margin-bottom: 32px; }

        .stats-container {
            display: flex; gap: 24px; margin-bottom: 40px;
        }

        .stat-box {
            background: rgba(255,255,255,0.05);
            padding: 16px 32px;
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.1);
            backdrop-filter: blur(5px);
        }

        .stat-box span { display: block; font-size: 24px; font-weight: 700; color: var(--primary); }
        .stat-box p { font-size: 0.85rem; color: #888; text-transform: uppercase; letter-spacing: 0.5px; }

        .btn {
            padding: 14px 36px;
            background: var(--primary); color: #121212;
            text-decoration: none; border-radius: 8px; font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #00e0a8;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 184, 148, 0.3);
        }

        /* Projects Section */
        .projects { padding: 80px 8%; background: #0a0a0a; }
        .projects-title { text-align: center; margin-bottom: 50px; font-size: 2rem; }
        
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 32px;
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, border-color 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            border-color: var(--primary);
        }

        .card h3 { font-size: 1.3rem; margin-bottom: 12px; color: var(--primary); }
        .card p { font-size: 0.9rem; color: #a0a0a0; margin-bottom: 24px; line-height: 1.5; }
        
        .tag-container { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 24px; }
        .tag {
            background: rgba(0, 184, 148, 0.1);
            color: var(--primary);
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .card-link {
            color: var(--light);
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .card-link:hover { color: var(--primary); }

        /* Contact Section */
        .contact { padding: 60px 8%; background: #050505; text-align: center; }
        .contact h2 { font-size: 2rem; margin-bottom: 16px; color: var(--light); }
        .contact p { color: #888; margin-bottom: 32px; }
        
        .contact-form {
            max-width: 600px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 16px;
            text-align: left;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-group label {
            font-size: 0.85rem;
            color: #888;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 6px;
            color: var(--light);
            font-size: 0.95rem;
            outline: none;
            transition: border-color 0.3s;
        }

        .form-group input:focus, .form-group textarea:focus {
            border-color: var(--primary);
        }

        .form-submit-btn {
            border: none;
            cursor: pointer;
            padding: 14px 32px;
            background: var(--primary);
            color: #121212;
            font-weight: 600;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .form-submit-btn:hover {
            background: #00e0a8;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 184, 148, 0.2);
        }

        /* Footer */
        footer { padding: 40px 8%; text-align: center; border-top: 1px solid rgba(255, 255, 255, 0.05); font-size: 0.85rem; color: #666; }
    </style>
</head>
<body>

    <nav>
        <h2>RICHARD RICH</h2>
        <ul class="nav-links">
            <li><a href="#projects">Projects</a></li>
            <li><a href="#contact" id="github-link-nav">GitHub</a></li>
            <li class="email-link">oprimalyoungforever@gmail.com</li>
        </ul>
    </nav>

    <section class="hero">
        <img id="profile-img" src="http://googleusercontent.com/generated_image_content/0" alt="Richard Rich">
        
        <h1 id="github-name">Loading...</h1>
        <p id="github-bio">Fetching developer data...</p>

        <div class="stats-container">
            <div class="stat-box">
                <span id="repo-count">5+</span>
                <p>Projects</p>
            </div>
            <div class="stat-box">
                <span id="follower-count">0</span>
                <p>Followers</p>
            </div>
        </div>

        <a href="#" id="github-link" target="_blank" class="btn">View GitHub Profile</a>
    </section>

    <section class="projects" id="projects">
        <h2 class="projects-title">Featured Projects</h2>
        <div class="grid">
            
            <div class="card">
                <h3>MERN Community Hub</h3>
                <p>A social networking application featuring user authentication, live feeds, messaging, and real-time interaction logic.</p>
                <div class="tag-container">
                    <span class="tag">React</span>
                    <span class="tag">Node.js</span>
                    <span class="tag">MongoDB</span>
                </div>
                <a href="#" target="_blank" class="card-link">View Source &rarr;</a>
            </div>
            
            <div class="card">
                <h3>Inventory Manager</h3>
                <p>Professional inventory and order management tool built with multiplier logic to calculate real-time inventory value.</p>
                <div class="tag-container">
                    <span class="tag">JavaScript</span>
                    <span class="tag">CSS</span>
                </div>
                <a href="#" target="_blank" class="card-link">View Source &rarr;</a>
            </div>

            <div class="card">
                <h3>Advanced Calculator</h3>
                <p>A styled scientific calculator featuring history logs, scientific functions (Trigonometry, Logarithms), and glassmorphism design.</p>
                <div class="tag-container">
                    <span class="tag">HTML/CSS</span>
                    <span class="tag">JavaScript</span>
                </div>
                <a href="#" target="_blank" class="card-link">View Source &rarr;</a>
            </div>

            <div class="card">
                <h3>Mini Browser Search</h3>
                <p>A responsive search interface that aggregates search data in an interactive UI using external Instant Answer APIs.</p>
                <div class="tag-container">
                    <span class="tag">JavaScript</span>
                    <span class="tag">API</span>
                </div>
                <a href="#" target="_blank" class="card-link">View Source &rarr;</a>
            </div>

            <div class="card">
                <h3>Personal Portfolio Website</h3>
                <p>A multi-section portfolio designed with clean UX and dynamic components to display work portfolios and statistics.</p>
                <div class="tag-container">
                    <span class="tag">JavaScript</span>
                    <span class="tag">CSS</span>
                </div>
                <a href="#" target="_blank" class="card-link">View Source &rarr;</a>
            </div>

        </div>
    </section>

    <section class="contact" id="contact">
        <h2>Get In Touch</h2>
        <p>Send me an email directly using the form below or at oprimalyoungforever@gmail.com</p>
        
        <form class="contact-form" action="mailto:oprimalyoungforever@gmail.com" method="POST" enctype="text/plain">
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" id="name" name="Name" required placeholder="Enter your name">
            </div>
            <div class="form-group">
                <label for="email">Your Email</label>
                <input type="email" id="email" name="Email" required placeholder="Enter your email address">
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="Message" rows="5" required placeholder="Write your message here..."></textarea>
            </div>
            <div>
                <button type="submit" class="form-submit-btn">Send Email</button>
            </div>
        </form>
    </section>

    <footer>
        <p>&copy; 2026 Richard Rich. Built with ❤️ and code.</p>
    </footer>

    <script>
        // Set this variable to your GitHub username when ready, or leave empty for the fallback.
        const username = ''; 

        async function fetchGitHubData() {
            const nameEl = document.getElementById('github-name');
            const bioEl = document.getElementById('github-bio');

            try {
                if (!username) {
                    throw new Error("No username configured");
                }

                const response = await fetch(`https://api.github.com/users/${username}`);
                
                if (!response.ok) throw new Error("User not found");

                const data = await response.json();

                // If GitHub is successful, overwrite with API data
                document.getElementById('profile-img').src = data.avatar_url; 
                nameEl.innerText = data.name || data.login;
                bioEl.innerText = data.bio || "Full Stack Developer";
                document.getElementById('repo-count').innerText = data.public_repos;
                document.getElementById('follower-count').innerText = data.followers;
                
                const githubLink = document.getElementById('github-link');
                githubLink.href = data.html_url;
                document.getElementById('github-link-nav').href = data.html_url;

            } catch (error) {
                // Keep Richard Rich profile info
                nameEl.innerText = "Richard Rich";
                bioEl.innerText = "Full Stack Developer | MERN Enthusiast";
                
                const githubLink = document.getElementById('github-link');
                githubLink.href = "https://github.com/";
                document.getElementById('github-link-nav').href = "https://github.com/";
            }
        }

        // Initialize API Call
        fetchGitHubData();
    </script>
</body>
</html>
