<template>
  <div id="app">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    />
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }"><i class="fas fa-home"></i></router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'the-landmarks'}">List of Landmarks in Rome</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>
<script>
// import BackgroundImage from "@/assets/homepage-image.jpg";

//export default {
//name: "App",

// data() {
//   return {BackgroundImage}
// }
// };
//
</script>

<style>

.fas {
  font-size: 35px;
}

#nav {
  color: white;
}
</style>
