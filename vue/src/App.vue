<template>
  <div id="app">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    >
    <header>
      <div class="nav-grid">
        <router-link class="header-text" v-bind:to="{ name: 'home'}">Roaming in Rome</router-link>
        <router-link
          class="welcome-back"
          v-bind:to="{ name: 'login'}"
        >{{typeof getUsers.username !== 'undefined' ? "Welcome back, " + this.$store.state.user.username + "!" : "Sign in to start your journey!"}}</router-link>
      </div>
      <aside class="drop-down-text">
        <nav class="dropdown">
          <input id="toggle2" type="checkbox">
          <label for="toggle2" class="animate menu">Menu</label>
          <ul class="animate">
            <li class="animate">
              <router-link class="home-button button" v-bind:to="{ name: 'home'}">Home</router-link>
            </li>
            <li class="animate">
              <router-link
                class="title-home-page button"
                v-bind:to="{ name: 'the-landmarks'}"
              >Landmarks</router-link>
            </li>

            <li class="animate">
              <router-link
                class="itinerary button"
                v-bind:to="{name: 'itineraries' , params: {id: this.$store.state.user.id}}"
              >Your Trips</router-link>
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

            <li class="animate">
              <router-link class="register button" v-bind:to="{name: 'register'}">New User?</router-link>
            </li>
          </ul>
        </nav>
      </aside>
    </header>
    <router-view/>
    <div class="team-golf">
      <div class="team-golf-text">Team Golf LLC</div>
      <i class="fas fa-golf-ball"></i>
    </div>
  </div>
</template>

<script>
export default {
  name: "App",
  components: {},
  computed: {
    getUsers() {
      return this.$store.state.user;
    }
  }
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans&family=Poiret+One&display=swap");

.nav-grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: ". header-text welcome-back";
}

.team-golf {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: "golf team-golf ";
}

.fa-golf-ball {
  grid-area: golf;
  text-align: right;
  margin: 2px;
  position: relative;
  right: 50px;
  top: 7px;
}

.team-golf-text {
  grid-area: team-golf;
  text-align: left;
  margin: 2px;
  position: relative;
  right: 50px;
  top: 5px;
}

.welcome-back {
  text-decoration: none;
  font-size: 20px;
  color: white;
  position: relative;
  top: 14px;
  right: 60px;
  text-align: right;
  grid-area: welcome-back;
}

.header-text {
  text-decoration: none;
  color: white;
  font-family: "Poiret One", cursive;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 35px;
  font-weight: bold;
  filter: drop-shadow(5px 5px 5px black);
  text-align: center;
  grid-area: header-text;
}

.menu {
  color: #b08555;
  font-family: "Open Sans", sans-serif;
  position: relative;
  z-index: 11;
}

header {
  padding-top: 20px;
  padding-bottom: 27px;
  background-color: #5ba1b0;
  width: 100vw;
  position: fixed;
  z-index: 9;
}

nav {
  padding: 24px;
  position: relative;
  bottom: 61px;
}

.drop-down-text {
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
test .fa {
  font-size: 0.8em;
  line-height: 22px !important;
}

.dropdown {
  display: inline-block;
}

.dropdown label,
.dropdown ul li {
  display: block;
  width: 200px;
  padding: 15px 20px;
}

.dropdown label:hover,
.dropdown ul li:hover {
  background: #5ba1b0;
  color: white;
  cursor: pointer;
}

.dropdown label {
  color: white;
  position: relative;
  z-index: 1;
}

.dropdown input {
  display: none;
}

.dropdown input ~ ul {
  position: relative;
  visibility: hidden;
  opacity: 0;
  top: -20px;
  z-index: 1;
}

.dropdown input:checked ~ ul {
  visibility: visible;
  opacity: 1;
  top: 0;
  background: rgba(255, 255, 255, 0.8);
}

/* dropdown ul li:nth-child(1) {
  border-left: 4px solid #e74c3c;
} */

.dropdown ul li:nth-child(1):hover {
  background: white;
  color: white;
}

.dropdown ul li:nth-child(2):hover {
  background: white;
  color: white;
}

.dropdown ul li:nth-child(3):hover {
  background: white;
  color: white;
}
.dropdown ul li:nth-child(4):hover {
  background: white;
  color: white;
}

.dropdown ul li:nth-child(5):hover {
  background: white;
  color: white;
}

.animate {
  text-transform: uppercase;
  -webkit-transition: all 0.8s;
  -moz-transition: all 0.8s;
  -ms-transition: all 0.8s;
  -ms-transition: all 0.8s;
  transition: all 0.8s;
  backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  /* Chrome and Safari */
  -moz-backface-visibility: hidden;
  /* Firefox */
  -ms-backface-visibility: hidden;
  /* Internet Explorer */
  border-radius: 0px 0px 4px 4px;
}

h1 {
  color: white;
}
body {
  /* padding: 30px; */
  background-color: #b4c2c5;
}

.button {
  color: #b18f69;
  font-size: 20px;
  padding: 15px;
  /* border: 4px solid black !important; */
  display: inline-block;
  text-decoration: none;
}

.button:hover {
  color: #494949 !important;
}
</style>
