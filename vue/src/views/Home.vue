<template class="tester">
  <div>
    <home-page></home-page>
    <p>You must be authenticated to see this</p>
  </div>
</template>

<script>
import HomePage from "@/components/HomePage.vue";

export default {
  components: {
    HomePage,
  },
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

body {
  background-image: url("~@/assets/homepage-image.jpg");
  background-position: top;
  background-size: 60rem 60rem;
  background-repeat: no-repeat;
  object-fit: cover;
}
</style>
