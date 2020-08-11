<template>
  <div id="app">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    >
    <aside class="drop-down-text">
      <nav class="dropdown">
        <input id="toggle2" type="checkbox">
        <label for="toggle2" class="animate menu">Menu</label>
        <ul class="animate">
          <li class="animate">
            <router-link class="home-button button" v-bind:to="{ name: 'home' }">Home</router-link>
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
            >Itinerary</router-link>
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
    <header>
      <div class="header-text">Roaming in Rome</div>
      <div
        class="welcome-back"
      >{{typeof getUsers.username !== 'undefined' ? "Welcome back, " + this.$store.state.user.username + "!" : "Sign in to start your journey!"}}</div>
    </header>
    <router-view/>
    <div class="container">Team Golf LLC</div>
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

.menu {
  color: #b08555;
  font-family: "Open Sans", sans-serif;
}

.welcome-back {
  font-size: 20px;
  color: white;
  text-align: right;
  position: relative;
  bottom: 28px;
  right: 50px;
}

.header-text {
  text-align: center;
  color: white;
  font-family: "Poiret One", cursive;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 35px;
  font-weight: bold;
  filter:
  drop-shadow(5px 5px 5px black);
  position: relative;
  top: 5px;
}

header {
  padding-top: 20px;
  background-color: #5ba1b0;
}

nav {
  padding: 24px;
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
  z-index: 2;
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
  border-radius: 4px;
}

.dropdown ul li:nth-child(2):hover {
  background: white;
  color: white;
  border-radius: 4px;
}

.dropdown ul li:nth-child(3):hover {
  background: white;
  color: white;
}
.dropdown ul li:nth-child(4):hover {
  background: white;
  color: white;
  border-radius: 4px;
}

.dropdown ul li:nth-child(5):hover {
  background: white;
  color: white;
  border-radius: 4px;
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
  border-radius: 4px;
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
  text-transform: uppercase;
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
