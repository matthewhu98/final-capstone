<template>
  <section>
    <div class="home-page">
      <home-page></home-page>
      <p>You must be authenticated to see this</p>
    </div>
  </section>
</template>

<script>
import HomePage from "@/components/HomePage.vue";

export default {
  name: "home",
  components: {
    HomePage
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: white;
  margin-top: 60px;
}

.home-page {
color: black;
}
</style>
