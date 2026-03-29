<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Richard | Developer Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #00b894;
            --dark: #121212;
            --light: #ffffff;
            --gray: #f4f4f4;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
        body { background: var(--gray); color: #333; line-height: 1.6; }
        nav { background: var(--dark); padding: 20px 10%; display: flex; justify-content: space-between; color: white; position: fixed; width: 100%; top: 0; z-index: 1000; }
        
        .hero { 
            height: 100vh; 
            background: linear-gradient(135deg, #1f4037, #121212); 
            display: flex; flex-direction: column; justify-content: center; align-items: center; 
            color: white; text-align: center; padding-top: 80px;
        }

        /* API Content Styling */
        #profile-img {
            width: 150px; height: 150px;
            border-radius: 50%;
            border: 4px solid var(--primary);
            margin-bottom: 20px;
            transition: 0.3s;
        }

        .stats-container {
            display: flex; gap: 20px; margin-top: 20px;
        }

        .stat-box {
            background: rgba(255,255,255,0.1);
            padding: 15px 25px;
            border-radius: 10px;
            backdrop-filter: blur(5px);
        }

        .stat-box span { display: block; font-size: 20px; font-weight: bold; color: var(--primary); }

        .btn {
            margin-top: 30px; padding: 12px 30px;
            background: var(--primary); color: white;
            text-decoration: none; border-radius: 5px; font-weight: 600;
        }
    </style>
</head>
<body>

    <nav>
        <h2>RICHARD</h2>
    </nav>

    <section class="hero">
        <img id="profile-img" src="https://via.placeholder.com/150" alt="Loading...">
        <h1 id="github-name">Loading...</h1>
        <p id="github-bio">Fetching developer data from GitHub...</p>

        <div class="stats-container">
            <div class="stat-box"><span id="repo-count">0</span> Projects</div>
            <div class="stat-box"><span id="follower-count">0</span> Followers</div>
        </div>

        <a href="#" id="github-link" target="_blank" class="btn">View GitHub Profile</a>
    </section>

    <script>
        // REPLACE 'your-github-username' with your actual username
        const username = 'octocat'; 

        async function fetchGitHubData() {
            try {
                const response = await fetch(`https://api.github.com/users/${username}`);
                
                if (!response.ok) throw new Error("User not found");

                const data = await response.json();

                // DOM Manipulation with API Data
                document.getElementById('profile-img').src = data.avatar_url;
                document.getElementById('github-name').innerText = data.name || data.login;
                document.getElementById('github-bio').innerText = data.bio || "Full Stack Developer";
                document.getElementById('repo-count').innerText = data.public_repos;
                document.getElementById('follower-count').innerText = data.followers;
                document.getElementById('github-link').href = data.html_url;

            } catch (error) {
                console.error("Error fetching API:", error);
                document.getElementById('github-name').innerText = "Developer Profile";
            }
        }

        // Initialize API Call
        fetchGitHubData();
    </script>
</body>
</html>

