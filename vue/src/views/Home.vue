<template>
  <div class="homepage-background">
    <div class="home-page">
      <div class="buffer"></div>
      <home-page></home-page>
    </div>
  </div>
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
  text-align: center;
  color: #494949 !important;
}

.buffer {
  margin: 12vh;
}

.home-page {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
}

.homepage-background {
  background-image: url(../assets/background-home-2.jpg);
  background-repeat: no-repeat;
  background-attachment: fixed;
  max-width: 100%;
  background-size: cover;
}
</style>
