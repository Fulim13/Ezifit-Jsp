
<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap");

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	display: flex;
	min-height: 100vh;
	background: #D3D3D3;
	align-items: center;
	justify-content: center;
}

h2 {
	color: #D3D3D3;
	font-size: 9vw;
	position: relative;
	text-transform: uppercase;
	-webkit-text-stroke: 0.3vw #D3D3D3;
}

h2::before {
	top: 0;
	left: 0;
	width: 0;
	height: 100%;
	color: #37b9f1;
	overflow: hidden;
	position: absolute;
	content: attr(data-text);
	border-right: 2px solid #37b9f1;
	-webkit-text-stroke: 0vw #f7f7fe;
	animation: animate 6s linear infinite;
}

@keyframes animate {
	0%,
	10%,
	100% {
		width: 0;
	}

	70%,
	90% {
		width: 100%;
	}
}
    .button {
        text-align: center;
        text-transform: uppercase;
        cursor: pointer;
        font-size: 20px;
        letter-spacing: 4px;
        position: relative;
        background-color: #16a085;
        border: none;
        color: #fff;
        padding: 20px;
        width: 200px;
        text-align: center;
        transition-duration: 0.4s;
        overflow: hidden;
        box-shadow: 0 5px 15px #193047;
        border-radius: 4px;
    }

    .button:hover {
        background: #fff;
        box-shadow: 0px 2px 10px 5px #1abc9c;
        color: #000;
    }

    .button:after {
        content: "";
        background: #1abc9c;
        display: block;
        position: absolute;
        padding-top: 300%;
        padding-left: 350%;
        margin-left: -20px !important;
        margin-top: -120%;
        opacity: 0;
        transition: all 0.8s
    }

    .button:active:after {
        padding: 0;
        margin: 0;
        opacity: 1;
        transition: 0s
    }

    .button:focus { outline:0; }
    
    
</style>

<%
  boolean success = (Boolean)session.getAttribute("success");
  if (success){%>
  <h2 data-text="Staff add successfully....">Staff add successfully....</h2>
      
  <%}else{%>
  <h2 data-text="Unable add staff....">Unable to add new staff.....</h2>
      
<%}%>

<button name="button" class="button" onclick="document.location='../../secureStaff/staffHomepage.jsp'">Back to staff home page</button>