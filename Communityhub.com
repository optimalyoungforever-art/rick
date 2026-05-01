<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Richards Social | Pro</title>
    <style>
        :root { --bg: #0f111a; --card: #1a1d2e; --primary: #0ea5e9; --text: #f8fafc; --muted: #94a3b8; }
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background: var(--bg); color: var(--text); margin: 0; padding: 12px; }
        .container { max-width: 480px; margin: auto; }
        .card { background: var(--card); padding: 18px; border-radius: 20px; margin-bottom: 16px; border: 1px solid rgba(255,255,255,0.08); }
        
        .user-nav { display: flex; gap: 10px; overflow-x: auto; padding-bottom: 15px; scrollbar-width: none; }
        .user-tab { flex: 0 0 auto; text-align: center; cursor: pointer; opacity: 0.5; transition: 0.3s; }
        .user-tab.active { opacity: 1; }
        .user-tab img { width: 45px; height: 45px; border-radius: 50%; border: 2px solid transparent; object-fit: cover; }
        .user-tab.active img { border-color: var(--primary); }
        .user-tab span { display: block; font-size: 0.65rem; margin-top: 4px; }

        .profile-setup { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; }
        #pfp-preview { width: 65px; height: 65px; border-radius: 50%; object-fit: cover; border: 3px solid var(--primary); background: #334155; }
        input, textarea { width: 100%; padding: 14px; margin: 8px 0; background: #0b0d14; border: 1px solid #334155; border-radius: 12px; color: white; box-sizing: border-box; font-size: 1rem; outline: none; }
        button { width: 100%; padding: 14px; background: var(--primary); color: white; border: none; border-radius: 12px; font-weight: bold; cursor: pointer; transition: 0.2s; }
        button:active { transform: scale(0.97); opacity: 0.8; }

        .notif-item { display: flex; align-items: center; gap: 12px; padding: 10px 0; border-bottom: 1px solid rgba(255,255,255,0.05); font-size: 0.85rem; }
        .notif-dot { width: 8px; height: 8px; background: var(--primary); border-radius: 50%; box-shadow: 0 0 8px var(--primary); animation: pulse 2s infinite; }
        @keyframes pulse { 0% { opacity: 1; } 50% { opacity: 0.4; } 100% { opacity: 1; } }

        .post { padding: 15px 0; border-bottom: 1px solid rgba(255,255,255,0.05); }
        .post-header { display: flex; align-items: center; gap: 12px; margin-bottom: 10px; }
        .post-pfp { width: 42px; height: 42px; border-radius: 50%; object-fit: cover; background: #1e293b; }
        .post-info b { font-size: 0.95rem; }
        .post-info span { display: block; font-size: 0.75rem; color: var(--muted); }
        
        .content { font-size: 1rem; line-height: 1.5; margin-bottom: 12px; color: #cbd5e1; }
        .post-media { width: 100%; border-radius: 12px; margin-bottom: 12px; border: 1px solid rgba(255,255,255,0.1); }
        
        .actions { display: flex; gap: 20px; color: var(--muted); font-size: 0.9rem; }
        .action-btn { cursor: pointer; display: flex; align-items: center; gap: 6px; transition: 0.2s; }
        .action-btn.liked { color: #f43f5e; font-weight: bold; }

        .comments { margin-top: 12px; background: rgba(0,0,0,0.2); border-radius: 12px; padding: 12px; }
        .comment { font-size: 0.85rem; margin-bottom: 8px; color: #e2e8f0; }
        .comment b { color: var(--primary); margin-right: 6px; }
        
        .reply-box { display: flex; gap: 8px; margin-top: 10px; }
        .reply-box input { margin: 0; padding: 8px 12px; font-size: 0.85rem; }
        .reply-box button { width: auto; padding: 0 15px; }

        .msg-list { display: flex; overflow-x: auto; gap: 12px; padding-bottom: 10px; margin-top: 10px; }
        .msg-user { min-width: 60px; text-align: center; cursor: pointer; }
        .msg-user img { width: 45px; height: 45px; border-radius: 50%; object-fit: cover; border: 2px solid transparent; }
        .msg-user.active img { border-color: var(--primary); }
        
        .chat-window { height: 180px; overflow-y: auto; background: #0b0d14; border-radius: 12px; padding: 10px; margin-bottom: 10px; border: 1px solid #334155; }
        .msg-bubble { margin-bottom: 8px; font-size: 0.85rem; max-width: 80%; padding: 8px 12px; border-radius: 15px; }
        .msg-sent { background: var(--primary); margin-left: auto; color: white; border-bottom-right-radius: 2px; }
        .msg-recv { background: #334155; color: white; border-bottom-left-radius: 2px; }

        .hidden { display: none; }
        .preview-wrap { position: relative; margin-bottom: 10px; }
        .clear-btn { position: absolute; top: 8px; right: 8px; background: rgba(0,0,0,0.6); color: white; border: none; border-radius: 50%; width: 24px; height: 24px; cursor: pointer; display: flex; align-items: center; justify-content: center; }
    </style>
</head>
<body>

<div class="container">
    <header style="padding: 10px 0; text-align: center;">
        <h2 style="margin: 0; letter-spacing: -0.5px;">Richards Social</h2>
    </header>

    <div id="multi-user-nav" class="user-nav"></div>

    <div id="authBox" class="card">
        <div class="profile-setup">
            <img id="pfp-preview" src="https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=100&q=40">
            <div style="flex:1">
                <input type="file" id="pfp-input" accept="image/*" onchange="processPfp(this)" style="display:none">
                <button onclick="document.getElementById('pfp-input').click()" style="background:#334155; font-size:0.8rem; padding:8px">Upload Photo</button>
            </div>
        </div>
        <input id="new-name" type="text" placeholder="Full Name">
        <input id="email" type="email" placeholder="Email Address">
        <button onclick="register()">Create & Login</button>
    </div>

    <div id="notifBox" class="card hidden">
        <h3 style="margin: 0 0 10px 0; font-size: 1rem; display: flex; justify-content: space-between;">
            Activity <div id="notif-dot" class="notif-dot hidden"></div>
        </h3>
        <div id="notif-list"></div>
    </div>

    <div id="msgBox" class="card hidden">
        <div id="msg-user-list" class="msg-list"></div>
        <div id="chat-container" class="hidden">
            <div id="chat-window" class="chat-window"></div>
            <div class="reply-box">
                <input id="msg-input" placeholder="Type a message...">
                <button onclick="sendDirectMsg()">Send</button>
            </div>
        </div>
    </div>

    <div id="postBox" class="card hidden">
        <div style="display:flex; align-items:center; gap:12px; margin-bottom:12px;">
            <img id="user-nav-pfp" style="width:35px; height:35px; border-radius:50%; object-fit:cover;">
            <b id="user-welcome"></b>
        </div>
        <textarea id="post-body" placeholder="Share something cool..." rows="2"></textarea>
        <div id="media-preview-container" class="preview-wrap hidden">
            <img id="media-preview" style="width:100%; border-radius:12px; max-height:180px; object-fit:cover;">
            <button class="clear-btn" onclick="clearMedia()">×</button>
        </div>
        <div style="display:flex; gap:8px;">
            <input type="file" id="post-img-input" accept="image/*" onchange="processPostMedia(this)" style="display:none">
            <button onclick="document.getElementById('post-img-input').click()" style="background:#334155; flex:1">📷 Media</button>
            <button onclick="createPost()" style="flex:2">Post</button>
        </div>
        <button onclick="logout()" style="background:none; color:#f43f5e; margin-top:10px; font-size:0.75rem; border:1px solid #334155">Sign Out</button>
    </div>

    <div class="card">
        <div id="feed-container"></div>
    </div>
</div>

<canvas id="comp" style="display:none"></canvas>

<script>
    let accounts = JSON.parse(localStorage.getItem('rs_accounts') || '[]');
    let currentUser = JSON.parse(localStorage.getItem('rs_session') || 'null');
    let posts = JSON.parse(localStorage.getItem('rs_posts') || '[]');
    let conversations = JSON.parse(localStorage.getItem('rs_msgs') || '{}');
    let notifications = JSON.parse(localStorage.getItem('rs_notifs') || '{}');

    let activeChatPartner = null;
    let pendingPfp = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=100&q=40";
    let pendingPostImg = null;

    const botMedia = [
        "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400&q=40",
        "https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=400&q=40",
        "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&q=40"
    ];

    const defaultUsers = [
        { name: "David Kimani", email: "david@social.com", pfp: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&q=40", isActive: true },
        { name: "Sarah Chen", email: "sarah@social.com", pfp: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&q=40", isActive: true },
        { name: "Marcus T.", email: "marcus@social.com", pfp: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&q=40", isActive: true }
    ];

    function init() {
        if (accounts.length === 0) { accounts = defaultUsers; save(); }
        renderUserTabs(); updateUI(); renderFeed(); startHeartbeat();
    }

    function runSimulation(type, targetEmail) {
        if (!targetEmail) return;
        
        setTimeout(() => {
            if (type === 'onMsg') {
                const id = [currentUser.email, targetEmail].sort().join('_');
                if (!conversations[id]) conversations[id] = [];
                const replies = ["Nice to meet you!", "How's your project going?", "I'm just browsing the feed.", "That sounds great!", "I'll reply soon."];
                conversations[id].push({ sender: targetEmail, text: replies[Math.floor(Math.random() * replies.length)] })
