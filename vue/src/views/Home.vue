<template>
  <section>
    <div :style="{backgroundImage: `url(${backpack-image.jpg})`}" class="image" >
      <home-page></home-page>
      <p>You must be authenticated to see this</p>
    </div>
  </section>
</template>

<script>
import HomePage from "@/components/HomePage.vue";

export default {
  components: {
    HomePage
  }
  // ,
  // data() {
  //   return {
  //     image: {backgroundImage: "~@/assests/backpack-image.jpg"}
  //   }
  // }
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

/* .image {
  background-image: url("~@/assets/homepage-image.jpg");
  background-position: top;
  background-size: 60rem 60rem;
  background-repeat: no-repeat;
  object-fit: cover;
  height: 150px;
  background-repeat: no-repeat
} */
</style>
