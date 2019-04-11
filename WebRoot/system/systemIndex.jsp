<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="master/systemHeader.jsp"%>
<div style="font-size:15px; line-height:15px">
	<style>
* {
	margin: 0;
	outline: none;
	padding: 0;
}

body {
	background: #000;
	font-family: 'Lucida Grande', 'Helvetica', 'Arial';
	font-size: 10px;
	overflow: hidden;
}

canvas {
	background: #222;
	cursor: default;
	z-index: 1;
}

.nope {
	color: #fff;
	text-align: center;
	margin-top: 150px;
}

#about {
	position: absolute;
	top: 150px;
	left:250px;
}

h1 {
	color: rgba(255, 255, 255, 0.75);
	float: left;
	font-size: 10px;
	font-weight: normal;
	margin: 20px;
}

a {
	display: inline-block;
	text-decoration: none;
	transition: 0.5s ease color;
	-moz-transition: 0.5s ease color;
	-o-transition: 0.5s ease color;
	-webkit-transition: 0.5s ease color;
}

a:hover {
	color: rgba(255, 255, 255, 0.75);
}

ul#options {
	list-style: none;
	margin: 10px 0 0;
	position: relative;
	right: 0;
	z-index: 10;
}

ul#options li {
	margin: 5px 0;
	min-width: 200px;
	opacity: 0;
	transition: 0.25s ease-in opacity;
	-moz-transition: 0.25s ease-in opacity;
	-o-transition: 0.25s ease-in opacity;
	-webkit-transition: 0.25s ease-in opacity;
}

ul#options li.group {
	margin-top: 15px;
}

ul#options li * {
	display: none;
}

ul#options li a {
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25);
	background-color: rgba(0, 0, 0, 0.5);
	border-radius: 3px;
	padding: 3px 5px;
	position: relative;
	transition: 0.5s ease all;
	-moz-border-radius: 3px;
	-o-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25);
	-moz-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25);
	-webkit-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25);
	-moz-transition: 0.5s ease all;
	-o-transition: 0.5s ease all;
	-webkit-transition: 0.5s ease all;
}

ul#options li a:hover {
	color: rgba(255, 255, 255, 0.75);
}

ul#options li a.on {
	background-color: rgba(255, 255, 255, 0.8);
	color: rgba(0, 0, 0, 0.9);
	text-shadow: 0px 0px 0px;
}

ul#options li a.on:after {
	content: "\2713 ";
}

ul#options.on li {
	opacity: 1;
	right: 20px;
}

ul#options.on li * {
	display: inline-block;
}

ul#borders {
	
}

ul#borders li {
	position: fixed;
	list-style: none;
	margin: 0;
	background-color: transparent;
	background-color: rgba(0, 0, 0, 0.05);
	z-index: 100;
}

li#top {
	height: 10px;
	left: 0;
	right: 0;
	top: 0;
}

li#right {
	bottom: 10px;
	right: 0;
	top: 10px;
	width: 10px;
}

li#bottom {
	bottom: 0;
	height: 10px;
	left: 0;
	right: 0;
}

li#left {
	bottom: 10px;
	left: 0;
	top: 10px;
	width: 10px;
}
</style>
	<canvas width="800" height="400" id="canvas">
		<p class="nope">不支持HTML5</p></canvas>
	<div id="about" style="display:none">
		<a href="#" id="toggle-options"></a>
		<ul id="options">
			<li><a href="#" id="quivers" class="on">抖动效果</a></li>
			<li><a href="#" id="gradient" class="on">灯光效果</a></li>
			<li><a href="#" id="color" class="on">色彩鲜明</a></li>
			<li><a href="#" id="valentineify" class="">情人节色彩</a></li>
			<li class="group"><span>鼠标按下: 粒子散开</span></li>
			<li><span>鼠标按下 + shift: 粒子聚合</span></li>
		</ul>
	</div>
	<script>
		var Clock = (function() {
	
			// private variables
			var canvas, // canvas element
				ctx, // canvas context
				bgGrad = true, // background gradient flag
				gradient, // gradient (background)
				height = 400, // canvas height
				key = {
					up : false,
					shift : false
				}, // key presses
				particles = [], // particle array
				particleColor = 'hsla(0, 0%, 100%, 0.3)', // particle color
				mouse = {
					x : 0,
					y : 0
				}, // position of mouse / touch
				press = false, // pressed flag
				quiver = false, // quiver flag
				text, // the text to copy pixels from
				textSize = 140, // (initial) textsize
				valentine = true, // valentine-ify it for a bit?
				msgTime = 100, // time to show a message before returning to clock
				updateColor = true, // update color of gradient / particles with time?
				width = 800; // canvas width
	
			// Constants
			var FRAME_RATE = 20, // frames per second target
				MIN_WIDTH = 800, // minimum width of canvas
				MIN_HEIGHT = 400, // minimum height of canvas
				PARTICLE_NUM = 600, // (max) number of particles to generate
				RADIUS = Math.PI * 2; // radius of particle
	
			var defaultStyles = function() {
				textSize = 140;
				// particle color
				particleColor = 'hsla(0, 0%, 100%, 0.3)';
	
				// color stops
				var gradientStops = {
					0 : '#333333',
					0.5 : '#222222'
				};
	
				// create gradient
				setGradient(gradientStops);
			};
	
			var draw = function(p) {
				ctx.fillStyle = particleColor;
				ctx.beginPath();
				ctx.arc(p.x, p.y, p.size, 0, RADIUS, true);
				ctx.closePath();
				ctx.fill();
			};
	
			var explode = function() {
				for (var i = 0, l = particles.length; i < l; i++) {
					var p = particles[i];
	
					if (p.inText) {
	
						var ax = mouse.x - p.px,
							ay = mouse.y - p.py,
							angle = Math.atan2(ay, ax),
							polarity,
							C = Math.cos(angle),
							S = Math.sin(angle);
	
						// change polarity
						// attract particles if mouse pressed, repel if shift + mousedown
						polarity = (key.shift === true) ? -1 : 1;
	
						p.x += polarity * (Math.pow((C - 1), 2) - 1) + p.velocityX * p.delta;
						p.y += polarity * (Math.pow((S - 1), 2) - 1) + p.velocityY * p.delta;
	
						// set previous positions
						p.px = p.x;
						p.py = p.y;
	
						draw(p);
					}
				}
			};
	
			var getTime = function(amPM) {
				var date = new Date(),
					hours = date.getHours(),
					timeOfDay = '';
	
				if (amPM) {
					hours = (hours > 12) ? hours -= 12 : hours;
					hours = (hours == 0) ? 12 : hours;
				} else {
					hours = pad(hours);
				}
	
				var minutes = pad(date.getMinutes());
				var seconds = pad(date.getSeconds());
				return {
					hours : hours,
					minutes : minutes,
					seconds : seconds,
					timeString : hours + " : " + minutes + " : " + seconds
				};
			};
	
			// animation loop
			var loop = function() {
	
				// clear out text
				ctx.clearRect(0, 0, width, height);
	
				var time = getTime(true);
	
				textSize = 140;
	
				// draw text on canvas
				if (valentine === true) {
					if (msgTime > 0) {
						textSize = 180;
						text = '?';
						msgTime--;
					} else {
						text = time.timeString;
					}
					// valentine-ify it by setting hue to pink
					setStyles(300);
	
				} else if (updateColor === true && bgGrad === true) {
					// changing color with time
					// @TODO: come up with something better, this is a hacky implementation
					var color = time.hours + time.minutes + time.seconds;
					setStyles(color);
					text = time.timeString;
				} else {
					defaultStyles();
					text = time.timeString;
				}
	
				ctx.fillStyle = "rgb(255, 255, 255)";
				ctx.textBaseline = "middle";
				ctx.font = textSize + "px 'Avenir', 'Helvetica Neue', 'Arial', 'sans-serif'";
				ctx.fillText(text, (width - ctx.measureText(text).width) * 0.5, height * 0.5);
	
				// copy pixels
				var imgData = ctx.getImageData(0, 0, width, height);
	
				// clear canvas, again
				ctx.clearRect(0, 0, width, height);
	
				if (bgGrad === true) {
					// draw gradient
					ctx.fillStyle = gradient;
					ctx.fillRect(0, 0, width, height);
				}
	
				if (press === false) {
					// reset particles
					for (var i = 0, l = particles.length; i < l; i++) {
						var p = particles[i];
						p.inText = false;
					}
					particleText(imgData);
				} else {
					explode();
				}
			};
	
			var pad = function(number) {
				return ('0' + number).substr(-2);
			};
	
			var particleText = function(imgData) {
	
				var pxls = [];
				for (var w = width; w > 0; w -= 6) {
					for (var h = 0; h < width; h += 6) {
						var index = (w + h * (width)) * 4;
						if (imgData.data[index] > 10) {
							pxls.push([ w, h ]);
						}
					}
				}
	
				var count = pxls.length;
				for (var i = 0; i < pxls.length && i < particles.length; i++) {
					try {
						var p = particles[i],
							X,
							Y;
	
						if (quiver) {
							X = (pxls[count - 1][0]) - (p.px + Math.random() * 5);
							Y = (pxls[count - 1][1]) - (p.py + Math.random() * 5);
						} else {
							X = (pxls[count - 1][0]) - p.px;
							Y = (pxls[count - 1][1]) - p.py;
						}
	
						// tangent
						var T = Math.sqrt(X * X + Y * Y);
	
						// arctangent
						var A = Math.atan2(Y, X);
	
						// cosine
						var C = Math.cos(A);
	
						// sine
						var S = Math.sin(A);
	
						// set new postition
						p.x = p.px + C * T * p.delta;
						p.y = p.py + S * T * p.delta;
	
						// set previous positions
						p.px = p.x;
						p.py = p.y;
	
						p.inText = true;
	
						// draw the particle
						draw(p);
	
						if (key.up === true) {
							p.size += 0.3;
						} else {
							var newSize = p.size - 0.5;
							if (newSize > p.origSize && newSize > 0) {
								p.size = newSize;
							} else {
								p.size = m.origSize;
							}
						}
					} catch (e) {
						//console.log(e);
					}
					count--;
				}
			};
	
			var setCoordinates = function(e) {
				if (e.offsetX) {
					return {
						x : e.offsetX,
						y : e.offsetY
					}; // use offset if available
				} else if (e.layerX) {
					return {
						x : e.layerX,
						y : e.layerY
					}; // firefox... make sure to position the canvas
				} else {
					// iOS. Maybe others too?
					return {
						x : e.pageX - canvas.offsetLeft,
						y : e.pageY - canvas.offsetTop
					};
				}
			};
	
			// set dimensions of canvas
			var setDimensions = function() {
				width = $(".page-content").width() - 20; //Math.max(window.innerWidth, MIN_WIDTH);
				height = document.documentElement.clientHeight - 160;
	
				// Resize the canvas
				canvas.width = width;
				canvas.height = height;
	
				canvas.style.left = '0px';
				canvas.style.top = '0px';
			};
	
			var setGradient = function(gradientStops) {
	
				// create gradient
				gradient = ctx.createRadialGradient(width / 2, height / 2, 0, width / 2, height / 2, width);
	
				// iterate through colorstops
				for (var position in gradientStops) {
					var color = gradientStops[position];
					gradient.addColorStop(position, color);
				}
			};
	
			var setStyles = function(hue) {
				// color stops
				var gradientStops = {
					0 : 'hsl(' + hue + ', 100%, 100%)',
					0.5 : 'hsl(' + hue + ', 10%, 50%)'
				};
	
				// change particle color
				particleColor = 'hsla(' + hue + ', 10%, 50%, 0.3)';
	
				// create gradient
				setGradient(gradientStops);
			};
	
			/** 
			 * Public Methods
			 */
			return {
				init : function(canvasID) {
	
					canvas = document.getElementById(canvasID);
					// make sure canvas exists and that the browser understands it
					if (canvas === null || !canvas.getContext) {
						return;
					}
					// set context
					ctx = canvas.getContext("2d");
	
					// set dimensions
					setDimensions();
	
					// ui
					this.ui();
	
					for (var i = 0; i < PARTICLE_NUM; i++) {
						particles[i] = new Particle(canvas);
					}
	
					// set defaults
					defaultStyles();
	
					// let's do this
					setInterval(loop, FRAME_RATE);
	
				},
	
				ui : function() {
	
					// UI: buttons and events
					var toggleOptions = document.getElementById('toggle-options'),
						options = document.getElementById('options'),
						onMsg = '[-] 隐藏设置',
						offMsg = '[+] 展开设置',
						quiverBtn = document.getElementById('quivers'),
						gradientBtn = document.getElementById('gradient'),
						valentineifyBtn = document.getElementById('valentineify'),
						colorBtn = document.getElementById('color');
	
					toggleOptions.innerHTML = offMsg;
	
					/**
					 * Events
					 */
					toggleOptions.addEventListener('click', function(e) {
						e.preventDefault();
						if (options.className === 'on') {
							options.className = '';
							toggleOptions.innerHTML = offMsg;
						} else {
							options.className = 'on';
							toggleOptions.innerHTML = onMsg;
						}
					}, false);
	
					quiverBtn.addEventListener('click', function(e) {
						e.preventDefault();
						if (quiverBtn.className === 'on') {
							quiverBtn.className = '';
							quiver = false;
						} else {
							quiverBtn.className = 'on';
							quiver = true;
						}
					}, false);
	
					gradientBtn.addEventListener('click', function(e) {
						e.preventDefault();
						if (gradientBtn.className === 'on') {
							gradientBtn.className = '';
							bgGrad = false;
						} else {
							gradientBtn.className = 'on';
							bgGrad = true;
						}
					}, false);
	
					valentineifyBtn.addEventListener('click', function(e) {
						e.preventDefault();
						if (valentineifyBtn.className === 'on') {
							valentineifyBtn.className = '';
							valentine = false;
							msgTime = 0;
						} else {
							valentineifyBtn.className = 'on';
							msgTime = 60;
							valentine = true;
						}
					}, false);
	
					colorBtn.addEventListener('click', function(e) {
						e.preventDefault();
						if (colorBtn.className === 'on') {
							colorBtn.className = '';
							updateColor = false;
						} else {
							colorBtn.className = 'on';
							updateColor = true;
						}
					}, false);
	
					document.addEventListener('keydown', function(e) {
						switch (e.keyCode) {
						case 16: // shift
							key.shift = true;
							e.preventDefault();
							break;
						case 38: // up key
							key.up = true;
							e.preventDefault();
							break;
						}
					}, false);
	
					document.addEventListener('keyup', function(e) {
						switch (e.keyCode) {
						case 16: // shift
							key.shift = false;
							e.preventDefault();
							break;
						case 38: // space
							key.up = false;
							e.preventDefault();
							break;
						}
					}, false);
	
					window.addEventListener('resize', function(e) {
						setDimensions();
					}, false);
	
					canvas.addEventListener('mousedown', function(e) {
						press = true;
					}, false);
	
					document.addEventListener('mouseup', function(e) {
						press = false;
					}, false);
	
					canvas.addEventListener('mousemove', function(e) {
						if (press) {
							mouse = setCoordinates(e);
						}
					}, false);
	
					// @TODO: add touch events
	
				}
			};
	
		})();
	
		// Create new particles
		var Particle = function(canvas) {
	
			var range = Math.random() * 180 / Math.PI, // random starting point
				spread = canvas.height, // how far away from text should the particles begin?
				size = Math.random() * 7; // random size of particle
	
			this.delta = 0.25;
			this.x = 0;
			this.y = 0;
	
			// starting positions
			this.px = (canvas.width / 2) + (Math.cos(range) * spread);
			this.py = (canvas.height / 2) + (Math.sin(range) * spread);
	
			this.velocityX = Math.floor(Math.random() * 10) - 5;
			this.velocityY = Math.floor(Math.random() * 10) - 5;
	
			this.size = size;
			this.origSize = size;
	
			this.inText = false;
	
		};
	
	
		Clock.init('canvas');
	</script>
</div>
<%@ include file="master/systemFooter.jsp"%>