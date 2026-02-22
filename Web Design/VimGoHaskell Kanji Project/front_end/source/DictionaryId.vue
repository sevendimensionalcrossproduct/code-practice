<template>
</template>

<script setup>
    import "particles.js";

    particlesJS('particles-js', {
  "particles": {
    "number": {
      "value": 130,
      "density": {
        "enable": true,
        "value_area": 800
      }
    },
    "color": {
      "value": [
    "#ffffff",
    "#ffe9c4",
    "#d4f0ff",
    "#aabfff",  
    "#f0e0ff"   
  ]
    },
    "shape": {
      "type": "circle"
    },
    "opacity": {
      "value": 1.0,
      "random": true,
      "anim": {
        "enable": true,
        "speed": 0.5,       
        "opacity_min": 0.3,
        "sync": false
      }
    },
    "size": {
      "value": 1.7,
      "random": true,
      "anim": {
        "enable": false
      }
    },
    "line_linked": {
      "enable": false
    },
    "move": {
      "enable": true,
      "speed": 0.3,
      "direction": "none",
      "random": true,
      "straight": false,
      "out_mode": "out",
      "bounce": false
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": {
      "onhover": {
        "enable": false
      },
      "onclick": {
        "enable": false
      },
      "resize": true
    }
  },
  "retina_detect": true
});
</script>

<style lang="scss">
    $primary: pink;

    h1 {
        color: $primary;
    }
    #particles-js {
      position: absolute;
      width: 100%;
      height: 100vh;
    }

    #particles-js canvas {
      filter: blur(1px) brightness(1.2);  
      position: absolute;
      top: 0;
      left: 0;
      z-index: -1;
    }
    #box {
      justify-content: center;
      align-items: center;
      color: green;
      border: 2px solid black;
      background-color: yellow;
      width: 300px;
      z-index: 1;
    }
    #Button {
        display: flex;
    }

    #searchInput {
    display: flex;
    justify-content: center;
    background-color: transparent; 
    color: white;                  
    border: none;                 
    outline: none;                
    width: 250px;                  
    }

    #searchInput::placeholder {
    color: white;
    opacity: 0.5;  
    }

    .wrapper {
      display: flex;             /* make flex container */
      justify-content: center;   /* center children horizontally */
      width: 100%;               /* span full width */
      margin: 20px 0;            /* optional spacing */
    }

    .glass{
	display: flex;
    align-items: center;
    width: 300px;
    height: 29px;
	padding: 5px;
	border: 0.2vh solid rgba(20,20,20,0.1);
	border-radius: 5px;
	backdrop-filter: blur(2vh);
	-webkit-backdrop-filter: blur(2vh);
	background: transparent;
    z-index: 1;
}
</style>

