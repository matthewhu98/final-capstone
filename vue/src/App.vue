<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'the-landmarks'}">
      List of Landmarks in Rome
      </router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>
<script>
// import BackgroundImage from "@/assets/homepage-image.jpg";

export default {
  name: "App",

  // data() {
  //   return {BackgroundImage}
  // }
};
</script>

<style>



#nav {
  color: white;
}
</style>
