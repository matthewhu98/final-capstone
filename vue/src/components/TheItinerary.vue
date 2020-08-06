<template>
  <div>
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    <div v-bind:key="landmark.name" v-for="landmark in this.$store.state.landmarks">
    <h1 v-if="landmark.inItinerary === false">{{landmark.name}}</h1>
    </div>
  </div>
</template>

<script>
import LandmarkService from "../services/LandmarkService";

export default {
  name: "the-itinerary",
  methods: {
    getItinerary(userId) {
      LandmarkService.getItinerary(userId).then(response => {
        this.$store.commit("SET_ITINERARY", response.data);
      });
    }
  },
  created() {
      this.getItinerary(this.$store.state.user);
  }
};
</script>

<style>
.text{
  color: black;
}
</style>