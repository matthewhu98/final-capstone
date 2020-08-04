<template>
  <div class="container">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    <div class="card" v-for="landmark in this.$store.state.landmarks" v-bind:key="landmark.name">
      <div>
        <img class="image" v-bind:src="getImageUrl(landmark.img)" />
      </div>
      <div>
        <router-link
          class="title"
          v-bind:to="{name: 'landmarkdetails' , params: {id: landmark.landmarkID}}"
        >{{landmark.name}}</router-link>
      </div>
    </div>
  </div>
</template>

<script>
// import LandmarkDetails from "@/components/LandmarkDetails.vue";
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",

  methods: {
    getLandmarks() {
      LandmarkService.list().then(response => {
        this.$store.commit("SET_LANDMARKS", response.data);
      });
    },
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    }
  },

  created() {
    this.getLandmarks();
  }
  // computed: {
  // locationList(){
  //     const locationArray = this.$store.state.locations;
  //     return locationArray;
  // }

  //}
};
</script>

<style>
.image {
  border-radius: 50%;
  flex: 1;
}
.title {
  text-decoration: none;
}

.card {
  /* display: flex; */
  font-family: "Nanum Gothic", sans-serif;
  font-size: 25px;
  /* align-items: center;
  justify-content: center; */
}
</style>