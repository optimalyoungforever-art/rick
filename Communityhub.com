<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Richard Chart Box | Premium Network</title>
    <style>
        :root { 
            --bg: #f8fafc; --card: #ffffff; --blue: #0062ff; --text: #1e293b; 
            --sub: #64748b; --green: #22c55e; --shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.04);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
        body { background: var(--bg); color: var(--text); padding-bottom: 50px; }

        .navbar { 
            background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(8px);
            padding: 15px 20px; box-shadow: 0 1px 2px rgba(0,0,0,0.05); 
            position: sticky; top: 0; z-index: 100; 
        }
        
        .main { max-width: 1150px; margin: 30px auto; display: grid; grid-template-columns: 280px 1fr 320px; gap: 24px; padding: 0 15px; }
        .card { background: var(--card); border-radius: 12px; padding: 20px; box-shadow: var(--shadow); margin-bottom: 20px; border: 1px solid #f1f5f9; position: relative; transition: 0.3s; }

        .avatar { background: #e2e8f0; border-radius: 50%; background-size: cover; background-position: center; display: inline-block; transition: 0.3s; }
        .av-lg { width: 90px; height: 90px; border: 4px solid white; margin-top: -45px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); cursor: pointer; }
        .av-sm { width: 36px; height: 36px; vertical-align: middle; border: 2px solid #fff; }
        .av-xs { width: 22px; height: 22px; border: 1px solid #fff; }
        .profile-header { background: linear-gradient(135deg, var(--blue), #a855f7); height: 80px; border-radius: 12px 12px 0 0; }

        .chat-window { position: fixed; bottom: 0; right: 30px; width: 300px; background: white; border-radius: 12px 12px 0 0; box-shadow: 0 -5px 20px rgba(0,0,0,0.1); display: none; flex-direction: column; z-index: 1000; border: 1px solid #e2e8f0; }
        .chat-header { background: var(--blue); color: white; padding: 12px; border-radius: 12px 12px 0 0; display: flex; justify-content: space-between; align-items: center; }
        .chat-body { height: 250px; overflow-y: auto; padding: 15px; background: #f8fafc; display: flex; flex-direction: column; gap: 10px; }
        .msg { max-width: 80%; padding: 8px 12px; border-radius: 15px; font-size: 13px; }
        .msg-user { align-self: flex-end; background: var(--blue); color: white; border-bottom-right-radius: 2px; }
        .msg-peer { align-self: flex-start; background: #e2e8f0; color: var(--text); border-bottom-left-radius: 2px; }

        .action-bar { display: flex; justify-content: space-around; border-top: 1px solid #f1f5f9; margin-top: 15px; padding-top: 10px; }
        .action-btn { background: none; border: none; color: var(--sub); cursor: pointer; font-weight: 600; padding: 10px; flex: 1; border-radius: 8px; font-size: 13px; display: flex; align-items: center; justify-content: center; gap: 6px; }
        .action-btn.liked { color: #ef4444; }

        .comment-section { background: #f8fafc; padding: 15px; border-radius: 0 0 12px 12px; margin: 10px -20px -20px; border-top: 1px solid #f1f5f9; }
        .comment-bubble { background: #fff; padding: 10px; border-radius: 10px; margin-bottom: 8px; font-size: 13px; border: 1px solid #e2e8f0; animation: slideIn 0.3s ease-out; }
        @keyframes slideIn { from { opacity: 0; transform: translateY(5px); } to { opacity: 1; transform: translateY(0); } }

        .status-dot { width: 8px; height: 8px; border-radius: 50%; background: var(--green); margin-left: auto; position: relative; }
        .pulse { position: absolute; width: 100%; height: 100%; background: var(--green); border-radius: 50%; animation: pulse 2s infinite; }
        @keyframes pulse { 0% { transform: scale(1); opacity: 1; } 100% { transform: scale(2.5); opacity: 0; } }

        .typing-indicator { font-size: 11px; color: var(--blue); height: 15px; margin-bottom: 5px; font-style: italic; }
    </style>
</head>
<body>

    <nav class="navbar">
        <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center;">
            <h2 style="color: var(--blue); font-weight: 900;">Richard Chart Box</h2>
            <div style="font-size: 12px; background: #eef2ff; color: var(--blue); padding: 6px 14px; border-radius: 20px; font-weight: bold;">● <span id="online-count">144</span> Online</div>
        </div>
    </nav>

    <div class="main">
        <aside>
            <div class="card" style="padding: 0; text-align: center; overflow: hidden;">
                <div class="profile-header"></div>
                <input type="file" id="p-in" style="display:none" onchange="upPic(this)">
                <div class="avatar av-lg user-avatar-sync" style="background-image: url('https://via.placeholder.com/150')" onclick="document.getElementById('p-in').click()"></div>
                <div style="padding: 15px;">
                    <h3>Richard</h3>
                    <p style="font-size: 10px; color: var(--blue); font-weight: bold;">CONTENT DIRECTOR</p>
                </div>
            </div>
            <div class="card">
                <h4 style="font-size: 11px; color: var(--sub); text-transform: uppercase; margin-bottom: 15px;">Active Audience</h4>
                <div id="m-list"></div>
            </div>
        </aside>

        <section>
            <div class="card">
                <div id="typing-status" class="typing-indicator"></div>
                <textarea id="post-text" style="width:100%; border:1px solid #e2e8f0; border-radius:8px; padding:12px; resize:none; min-height:80px; outline:none;" placeholder="Share with the network..."></textarea>
                <div id="media-preview" style="display:none; padding:10px; background:#f0f7ff; border:2px dashed var(--blue); margin-top:10px; border-radius:8px; font-size:12px;"></div>
                <div style="display:flex; gap:10px; margin-top:12px; border-top:1px solid #f1f5f9; padding-top:12px;">
                    <button class="action-btn" style="border:1px solid #eee" onclick="trig('image/*')">📷 Image</button>
                    <button class="action-btn" style="border:1px solid #eee" onclick="trig('video/*')">🎥 Video</button>
                    <button class="action-btn" style="border:1px solid #eee" onclick="trig('audio/*')">🎵 Audio</button>
                    <input type="file" id="m-in" style="display:none" onchange="hMedia(this)">
                </div>
                <button onclick="cPost()" style="background:var(--blue); color:white; border:none; padding:12px; border-radius:8px; width:100%; margin-top:12px; font-weight:bold; cursor:pointer;">BROADCAST</button>
            </div>
            <div id="feed-container"></div>
        </section>

        <aside>
            <div class="card">
                <h4 style="font-size: 11px; color: var(--sub); text-transform: uppercase; margin-bottom: 10px;">Network Influence</h4>
                <div style="height: 10px; background: #e2e8f0; border-radius: 10px; overflow: hidden;">
                    <div id="impact-fill" style="width: 15%; height: 100%; background: var(--green); transition: 1s;"></div>
                </div>
                <p style="font-size: 12px; margin-top: 10px;">Reach: <strong id="impact-val">15%</strong></p>
            </div>
            <div class="card">
                <h4 style="font-size: 11px; color: var(--sub); text-transform: uppercase; margin-bottom: 10px;">Trending Topics</h4>
                <p style="font-size: 13px; color: var(--blue); margin-bottom: 5px;">#WebDevelopment</p>
                <p style="font-size: 13px; color: var(--blue); margin-bottom: 5px;">#RichardChartBox</p>
                <p style="font-size: 13px; color: var(--blue);">#GlobalTech</p>
            </div>
        </aside>
    </div>

    <div id="chat-win" class="chat-window">
        <div class="chat-header"><span id="c-name">Chat</span><button onclick="clChat()" style="background:none; border:none; color:white; font-size:20px; cursor:pointer;">&times;</button></div>
        <div id="chat-body" class="chat-body"></div>
        <div style="padding:10px; border-top:1px solid #eee; display:flex; gap:5px;">
            <input type="text" id="c-input" style="flex:1; border:1px solid #eee; border-radius:20px; padding:8px 12px; outline:none; font-size:13px;" placeholder="Message...">
            <button onclick="sDM()" style="color:var(--blue); border:none; background:none; font-weight:bold; cursor:pointer;">SEND</button>
            <button onclick="clChat()" style="color:var(--sub); border:none; background:none; font-size:11px; cursor:pointer;">CANCEL</button>
        </div>
    </div>

    <script>
        const members = [
            {n:"Elena R.", a:"51", m:"enthusiastic"}, 
            {n:"David Chen", a:"52", m:"analytical"}, 
            {n:"Sarah J.", a:"53", m:"supportive"}, 
            {n:"Marcus Vox", a:"54", m:"skeptical"}, 
            {n:"Lila K.", a:"55", m:"creative"}
        ];

        const contextReplies = {
            image: ["Stunning quality!", "I love the composition.", "This is wallpaper material."],
            video: ["Great production!", "That edit is smooth.", "I could watch this all day."],
            audio: ["What a vibe!", "The sound is so crisp.", "Adding this to my playlist!"],
            text: ["Completely agree.", "This is a great point.", "Thanks for the insight!"]
        };

        const moodReplies = {
            enthusiastic: ["Absolutely brilliant!", "Let's make this happen!", "You're on fire today!"],
            analytical: ["What are the technical specs?", "The logic seems optimal.", "Let's review the data."],
            supportive: ["I'm rooting for you!", "How can I help?", "Brilliant work."],
            skeptical: ["Are we sure about the scale?", "I'd test that first.", "Could be risky."],
            
