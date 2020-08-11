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
  /* margin-top: 60px; */
}
.buffer {
  margin:15vh;
}

.home-page {
  color: black;
  display:flex;
  flex-direction: column;
  justify-content: flex-end;
  /* padding: 5rem; */
 
 
  /* top: 0;
  left: 0;
  bottom: 0;
  right: 0; */
  /* background-color: #b4c2c5; */
}
.homepage-background {
background-image: url(../assets/background-home-cropped.jpg);
background-repeat: no-repeat;
background-position: top;
background-size: 100vw;
min-width: 420px;
  /* padding: 0 0 50% 0; */
height: 100vh;
width: auto;
position: center;
  /* margin: 18%; */
  /* height: 100%;
  width: 100%; */
  
}
</style>
