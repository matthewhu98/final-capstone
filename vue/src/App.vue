<template :style="{backgroundImage:`url(${BackgroundImage})`}">
  <div id="app" >
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      
    </div>
    <router-view />
  </div>
  
</template>
<script>
import BackgroundImage from "@/assets/homepage-image.jpg";
export default {
  name: "App",
  data() {
    return {BackgroundImage}
  }
}
</script>

<style lang="stylus" scoped>
body {  
  background-image: url('background.jpg');
  }
</style>
