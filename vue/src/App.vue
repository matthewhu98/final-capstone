<template>
  <div id="app">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    />
    <div id="nav">
      <router-link class="home-button button" v-bind:to="{ name: 'home' }">
        <i class="fas fa-home"></i>
      </router-link>
      <router-link
        class="title-home-page button"
        v-bind:to="{ name: 'the-landmarks'}"
      >List of Landmarks in Rome</router-link>
      <!-- <router-link class="itinerary-route" v-bind:to="{name: 'itinerary'}">
        <i class="fas fa-clipboard-list"></i>
      </router-link>-->
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
    </div>
    <router-view />
  </div>
</template>
<script>
// export default {
// name: "App",
</script>

<style>
#nav {
  background-color: #b4c2c5;
  padding-top: 2rem;
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
  padding: 150px;
}

.button {
  color: black !important;
  text-transform: uppercase;
  font-size: 17px;
  padding: 15px;
  border: 4px solid black !important;
  border-radius: 6px;
  display: inline-block;
  transition: all 0.3s ease 0s;
  text-decoration: none;
  margin-left: 1rem;
  margin-right: 1rem;
}

.button:hover {
  /* color: #494949 !important; */
  border-radius: 50px;
  /* border-color: #494949 !important; */
  transition: all 0.3s ease 0s;
  text-decoration: none;
  
  color:#b4c2c5;
  background: #fff;
    
    transition: .4s;
}
</style>
