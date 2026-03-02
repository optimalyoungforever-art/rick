<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Richard | Portfolio</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: 'Segoe UI', sans-serif;
}

html{
    scroll-behavior:smooth;
}

body{
    background:#f4f4f4;
    color:#333;
}

/* NAVIGATION */
nav{
    background:#111;
    padding:15px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    position:fixed;
    width:100%;
    top:0;
    z-index:1000;
}

nav h2{
    color:#fff;
}

nav ul{
    list-style:none;
    display:flex;
    gap:20px;
}

nav ul li a{
    color:#fff;
    text-decoration:none;
    font-size:15px;
    transition:0.3s;
}

nav ul li a:hover{
    color:#00b894;
}

/* HERO SECTION */
.hero{
    height:100vh;
    background:linear-gradient(135deg,#1f4037,#99f2c8);
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
    padding:20px;
    color:white;
}

.hero-content img{
    width:180px;
    height:180px;
    border-radius:50%;
    object-fit:cover;
    border:5px solid white;
    margin-bottom:20px;
}

.hero h1{
    font-size:40px;
}

.hero p{
    margin-top:10px;
    font-size:18px;
}

.btn{
    margin-top:20px;
    padding:12px 25px;
    background:#111;
    color:white;
    border:none;
    border-radius:30px;
    cursor:pointer;
    transition:0.3s;
    text-decoration:none;
    display:inline-block;
}

.btn:hover{
    background:#00b894;
}

/* SECTION */
section{
    padding:80px 40px;
    max-width:1000px;
    margin:auto;
}

section h2{
    text-align:center;
    margin-bottom:40px;
    font-size:28px;
    color:#1f4037;
}

/* ABOUT */
.about p{
    text-align:center;
    max-width:700px;
    margin:auto;
    line-height:1.6;
}

/* SKILLS */
.skills-container{
    display
