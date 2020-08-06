<template>
  <div>
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    <div v-for="itinerary in this.$store.state.itineraries" v-bind:key="itinerary.itineraryID">
    <h1>{{itinerary.name}} </h1>
    </div>
  </div>
</template>

<script>
import LandmarkService from "../services/LandmarkService";

export default {
  name: "itinerary-list",
  methods: {
    getItinerary(userId) {
      LandmarkService.getItinerary(userId).then(response => {
        this.$store.commit("SET_ITINERARIES", response.data);
      });
    }
  },
  created() {
      this.getItinerary(this.$store.state.user.id);
  }
};
</script>

<style>
.text{
  color: black;
}
</style>