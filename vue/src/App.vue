<template>
  <div id="app">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    />
    <aside class="drop-down-text">
      <dropdown>
        <input id="toggle2" type="checkbox" />
        <label for="toggle2" class="animate menu">Menu</label>
        <ul class="animate">
          <li class="animate">
            <router-link class="home-button button" v-bind:to="{ name: 'home' }">
              <!-- <i class="fas fa-home"></i> -->
              HOME
            </router-link>
          </li>
          <li class="animate">
            <router-link
              class="title-home-page button"
              v-bind:to="{ name: 'the-landmarks'}"
            >Landmarks</router-link>
          </li>

          <li class="animate">
            <router-link
              class="itinerary-route button"
              v-bind:to="{name: 'itineraries' , params: {id: this.$store.state.user.id}}"
            >
              <!-- <i class="fas fa-clipboard-list"></i> -->
              ITINERARY
            </router-link>
          </li>

          <li class="animate">
            <router-link
              class="button"
              v-bind:to="{ name: 'login' }"
              v-if="$store.state.token === ''"
            >Login</router-link>
            <router-link
              class="button"
              v-bind:to="{ name: 'logout' }"
              v-if="$store.state.token != ''"
            >Logout</router-link>
          </li>
        </ul>
      </dropdown>
    </aside>

    <router-view />
  </div>
</template>
<script>
// export default {
// name: "App",
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans&family=Poiret+One&display=swap");

/* #nav {
  background-color: #b4c2c5;
  padding-top: 2rem;
} */

.menu {
  color: #b08555;
  font-family: "Open Sans", sans-serif;
}
.drop-down-text {
  /* color: gray; */
  display: flex;
  justify-content: left;
  font-family: "Open Sans", sans-serif;
  font-size: 25px;
  position: fixed;
  z-index: 1;
}
* {
  padding: 0;
  margin: 0;

  box-sizing: border-box;
}

/* .float-right {
  float: right;
} */

.fa {
  font-size: 0.8em;
  line-height: 22px !important;
}

dropdown {
  display: inline-block;

  /* margin: 20px 50px; */
}

dropdown label,
dropdown ul li {
  display: block;
  width: 200px;
  /* background: #ecf0f1; */
  padding: 15px 20px;
}

dropdown label:hover,
dropdown ul li:hover {
  background: #5ba1b0;
  color: white;
  cursor: pointer;
}

dropdown label {
  color: white;
  /* border: 4px solid saddlebrown;
  border-radius: 10px; */
  position: relative;
  z-index: 2;
}

dropdown input {
  display: none;
}

dropdown input ~ ul {
  position: relative;
  visibility: hidden;
  opacity: 0;
  top: -20px;
  z-index: 1;
}

dropdown input:checked ~ ul {
  visibility: visible;
  opacity: 1;
  top: 0;
  background: rgba(255, 255, 255, 0.386);
}

/* dropdown ul li:nth-child(1) {
  border-left: 4px solid #e74c3c;
} */

dropdown ul li:nth-child(1):hover {
  background: white;
  color: white;
}

dropdown ul li:nth-child(2):hover {
  background: white;
  color: white;
}

dropdown ul li:nth-child(3):hover {
  background: white;
  color: white;
}
dropdown ul li:nth-child(4):hover {
  background: white;
  color: white;
}

.animate {
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -ms-transition: all 0.3s;
  transition: all 0.3s;
  backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  /* Chrome and Safari */
  -moz-backface-visibility: hidden;
  /* Firefox */
  -ms-backface-visibility: hidden;
  /* Internet Explorer */
}

/*.title-home-page {
  background: #fef9c7;
  color: #026670;
  border: 1px solid black; 
  text-decoration: none;
  font-size: 18px;
  letter-spacing: 2px;
  margin: 5px;
  padding: 7px 10px 7px 10px;
  border-radius: 5px 20px 5px;
}

.title-home-page:hover {
  filter: drop-shadow(9px 9px 9px #026670);
  border-radius: 5px 20px 5px;
}
.home-button {
  color: #026670;
}

.home-button:hover {
  color: black;
}

.itinerary-route {
  color: #026670;
}

.itinerary-route:hover {
  color: black;
}*/
h1 {
  color: white;
}
body {
  padding: 10px;
}

.button {
  color: #b18f69;
  text-transform: uppercase;
  font-size: 20px;
  padding: 15px;
  /* border: 4px solid black !important; */
  border-radius: 6px;
  display: inline-block;

  text-decoration: none;
  /* margin-left: 1rem;
  margin-right: 1rem; */
}

.button:hover {
  color: #494949 !important;
  /* border-radius: 50px; */
  /* border-color: #494949 !important; */
}
</style>
